from pyspark.sql import SparkSession
import pyspark.sql.functions as F

def transform_spark_dataframe_into_star_schema(
    dataframe,
    colunas_fato = ["col1", "col2"],
    tabela_fato_nome = "tabela_fato",
    mapping_colunas_dimensao = {'dim1':["col3", "col4"], "dim2":["col5", "col6"]},
):

    colunas_fato_e_dimensao = colunas_fato + [col for cols in mapping_colunas_dimensao.values() for col in cols]
    dataframe = dataframe.select(*colunas_fato_e_dimensao)

    dimensions = []
    for dim, cols in mapping_colunas_dimensao.items():

        df_dimension = dataframe.select(*cols).distinct()
        sk_name = f"sk_{dim.replace('DIM_', '')}"
        # add unique id to dimension
        df_dimension = df_dimension.withColumn(sk_name, F.monotonically_increasing_id())

        dimensions.append( (dim, df_dimension) )



    # Substitui as colunas de dimensão pelo respectivo SK na tabela fato
    # ------------------------------------------------------------------
    for dim, df_dimension in dimensions:
        # join the dimension dataframe to the original dataframe
        dataframe = dataframe.join(
            df_dimension, 
            on=[
                dataframe[col] == df_dimension[col]
                for col in mapping_colunas_dimensao[dim]
            ],
            how="left"
        )

        # drop the original columns
        dataframe = dataframe.drop(*mapping_colunas_dimensao[dim])
    return [ (tabela_fato_nome, dataframe) ] + dimensions