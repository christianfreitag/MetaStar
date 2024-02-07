# MetaStar

### Rodar Docker

* Subir docker com postgres e Metabase

```
    docker compose up
```

* Configurações iniciais no metabase
1. Entre no link do metabase, geralmente [localhost:3000]
2. Cria sua conta 
3. Conecte o banco com os seguintes dados:
```
    nomeAmigavel: você decide :)
    servidor: postgres
    porta: 5432
    database: metabase
    usuario: metabase
    senha: metabase
    schemas: Selecione 'Apenas estes' e digite 'votacao_candidato'

    CASO JA POSSUA CONTA:
    email: metabase
    senha: metabase

```


### Executar script

* Cria ambiente venv (Opcional)
```
    python -m venv .venv
    .venv/Scripts/Activate
```

* Instalar requerimentos
```
    pip install -r requirements.txt
```

* Baixe o parquet.gzip do link e cole na pasta *data*
[https://drive.google.com/file/d/1-53cfjTUH-X4D_lj_TJqy97c46At-9oj/view?usp=drive_link]

* Execute um por um