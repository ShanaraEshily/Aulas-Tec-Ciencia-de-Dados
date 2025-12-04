#Data: 07/11/2025

import mysql.connector #driver

#configurar a conexão com o banco de dados
mydb = mysql.connector.connect(
    host = "localhost",
    port = 3307,
    user = "root",
    password = "senac",
    database = "fitlife",
    use_pure = True #garante o uso do driver puro em Pyhton
)

#cria o cursor para executar comandos em SQL
cursor = mydb.cursor()

#executa uma query simples no DB
cursor.execute ("select \
                    al.nome,\
                    pl.nome\
                from matriculas mt \
                join alunos al on mt.codigo_aluno = al.codigo\
                join planos pl on mt.codigo_plano = pl.codigo")

#recupera todos os resultados das query
tabela = cursor.fetchall()

#imprime na tela os resultados
#salvar os dados em um arquivo CSV
#gerar um gráfico
#enviar um e-mail com os dados
#salvar os dados em outro banco de dados
#gerar um relatório em PDF de forma automática todo mês

#disponibilizar os dados via API REST

#print('Texto sem formatação')

#texto_extra = '123456'

#print(f'Texto com formatação {texto_extra}')

for linha in tabela:
    print(linha)
    
#ATENÇÃO!!
#fechar o cursor e a conexão com o banco de dados