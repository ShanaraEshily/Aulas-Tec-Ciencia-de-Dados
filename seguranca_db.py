# data: 27/11/2025

import mysql.connector
import dotenv
import os

#carrega variáveis de ambiente do arquivo .env
dotenv.load_dotenv()

print("DEBUG PORT:", os.getenv("port"))

conn = mysql.connector.connect(
    host = os.getenv("host"),
    user = os.getenv("user"), 
    password = os.getenv("password"),
    port=int(os.getenv("port")),
    database = os.getenv("database"),
    use_pure = True
)

