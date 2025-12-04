#Data: 10/11/2025

import mysql.connector
import csv
from datetime import datetime

mydb = mysql.connector.connect(
    host = 'localhost',
    port = 3307,
    user = 'root',
    password = 'senac',
    database = 'fitlife',
    use_pure = True
)

cursor = mydb.cursor()

cursor.execute ("select * from alunos;")

resultados = cursor.fetchall()

#CSV
with open("matricula.csv", "w", newline = "", encoding = "utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(["Nome", "Matrícula", "CPF", "Data Nascimento", "Plano"])
    
    for linha in resultados:
        nome = linha[1].upper()
        data_nascimento = linha[2].strftime('%d/%m/%Y')
        cpf = f"{linha[6][:2]}.***.***-{linha[6][-2:]}"
        numero_matricula = f"{linha[7]:08d}"
        plano = linha[9]
    
        print(f'{nome}, {data_nascimento}, {cpf}, {numero_matricula}, {plano}\n')
        writer.writerow([nome, data_nascimento, cpf, numero_matricula, plano])
        
cursor.close()
mydb.close()