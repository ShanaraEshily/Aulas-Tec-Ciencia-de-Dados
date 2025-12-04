#Data: 05/11/2025

import mysql.connector

mydb = mysql.connector.connect(
    host = 'localhost',
    port = 3307,
    user = 'root',
    password = 'senac',
    database = 'fitlife',
    use_pure = True #força a entrada do script no banco de dados 
)

# cria o cursor para executar comandos SQL
cursor = mydb.cursor()

# executa uma query simples no DB
cursor.execute("select * from alunos;")

# recupera todos os resultados da query
resultados = cursor.fetchall()

#importa o módulo datetime (10/11/2025)
from datetime import datetime

with open ("dados.csv", "w") as file:
    #imprime os resultados
    for linha in resultados:
        #para cada linha, calcula a idade e formata o cpf
        idade = datetime.now().year - linha[2].year
        cpf_formatado = f"{linha[6][:3]}.***.***-{linha[6][-2:]}"
        data_nascimento_formatada = linha[2].strftime('%d/%m/%Y')
        
        print(f'{linha[1]}, {data_nascimento_formatada}, {idade}, {cpf_formatado}')
        #grava os dados no script (10/11/2025)
        file.write(f'{linha[1]}, {data_nascimento_formatada}, {idade}, {cpf_formatado}\n')
           
#ATENÇãO!!
#fecha o cursor e a conexão com o banco de dados
cursor.close()
mydb.close()