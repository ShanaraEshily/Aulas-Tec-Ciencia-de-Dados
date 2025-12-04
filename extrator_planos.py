#Data: 11/11/2025

import mysql.connector

mydb = mysql.connector.connect(
    host = 'localhost',
    port = 3307,
    user = 'root',
    password = 'senac',
    database = 'fitlife',
    use_pure = True
)

cursor = mydb.cursor()

cursor.execute("""
    select 
        pl.nome, 
        pl.valor_mensal as valor_mensal, 
        pl.duracao_meses as duracao_meses
        from planos pl
        order by nome;
""")

resultados = cursor.fetchall()

with open ("plano.csv", "w") as file:
    #imprime os resultados
    for linha in resultados:
        nome = linha[0]
        valor_mensal = linha[1]
        valor_formatado = f'R${valor_mensal}'
        duracao_meses = linha[2]
        
        print(f'{nome}, {valor_formatado}, {duracao_meses}')
        #grava os dados no script (10/11/2025)
        file.write(f'{nome}, {valor_formatado}, {duracao_meses}\n')
        
cursor.close()
mydb.close()