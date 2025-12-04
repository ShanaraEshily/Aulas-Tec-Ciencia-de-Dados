#Data: 17/11/2025

import mysql.connector
import csv
from datetime import datetime

mydb = mysql.connector.connect(
    host = 'localhost',
    port = 3307,
    user = 'root',
    password = 'senac',
    database = 'loja_simples',
    use_pure = True
)

cursor = mydb.cursor()

cursor.execute ('select \
    cl.nome AS nome_cliente, \
    pr.nome AS nome_produto, \
    vd.quantidade AS quantidade, \
    pr.preco_produto AS preco_unitario, \
    (vd.quantidade * pr.preco_produto) AS valor_total, \
    vd.data_venda AS data_venda \
FROM \
	venda vd \
inner join \
	cliente cl on cl.codigo = vd.cliente \
inner join 	produto pr on pr.codigo = vd.produto \
;')

resultados = cursor.fetchall()

#CSV
with open("relatorio_venda.csv", "w", newline = "", encoding = "utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(["Nome", "Produto", "Quantidade", "Valor", "Data Venda"])
    
    for linha in resultados:
        nome_cliente = linha[0].upper()
        nome_produto = linha[1].upper()
        quantidade = linha[2]
        preco_unitario = linha[3]
        valor_total = linha[4]
        data_venda = linha[5].strftime('%d/%m/%Y')
    
        print(f'{nome_cliente}, {nome_produto}, {quantidade}, {preco_unitario}, {valor_total}, {data_venda}\n')
        writer.writerow([nome_cliente, nome_produto, quantidade, preco_unitario, valor_total, data_venda])
        
cursor.close()
mydb.close()