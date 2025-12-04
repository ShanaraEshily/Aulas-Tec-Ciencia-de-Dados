#Data: 24/11/2025

import pandas as pd
import mysql.connector

#1 - Conectar ao banco de dados.
conn = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "senac",
    port = 3307,
    database = "loja_virtual",
    use_pure = True
)

#2 - Consultar todos os registros da tabela clientes.
clientes_df = pd.read_sql ("select * from clientes", conn)
print(clientes_df)

#3 - Carregar os dados em um DataFrame pandas.
clientes_df = pd.read_sql ("select * from clientes", conn)
print("DataFrame Clientes")
print (clientes_df.head(10)))