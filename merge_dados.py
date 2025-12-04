#Data: 24/11/2025

import pandas as pd
import mysql.connector

conn = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "senac",
    port = 3307,
    database = "fitlife",
    use_pure = True
)

alunos_df = pd.read_sql ("select * from alunos", conn)
matriculas_df = pd.read_sql("select * from matriculas", conn)

print("DataFrame Alunos")
print(alunos_df.head(5))

print("\nDataFrame Matrículas")
print(matriculas_df.head(5))

#primeira opção de merge
merge_df = pd.merge(alunos_df, matriculas_df, left_on = "codigo", right_on = "codigo_aluno", how = "inner")
print("\nDataFrame Mesclado (Alunos + Matrículas): ")
print(merge_df.head(10))

#segunda opção de merge
merge_df = alunos_df.merge (matriculas_df, left_on = "codigo", right_on = "codigo_aluno", how = "inner")
print("\nDataFrame Mesclado (Alunos + Matrículas): ")
print(merge_df.head(10))

# removendo colunas desnecessárias
#priemeira opção
merge_df.drop(columns = ["data_nascimento", "telefone", "email", "data_cadastro", 
                         "cpf", "data_inicio", "status_matricula", "codigo_aluno", 
                         "codigo_instrutor", "codigo_plano"], inplace = True)
print("\nDataFrame Mesclado após remoção de colunas desnecessárias:")
print(merge_df.head(10))

# segunda opção
segundo_merge_df = merge_df[['codigo_matricula', 'nome', 'codigo_matricula']] 
#
print(segundo_merge_df) 

# renomeado colunas 
merge_df.rename (columns = {"nome": "nome_completo"}, inplace = True)
print("\nDataFrame Mesclado após renomear coluna: ")
print(merge_df.head(10))

merge_df.rename (columns = {"nome": "nome_completo", "cpf": "cpf_aluno"}, inplace = True)
print("\nDataFrame Mesclado após renomear colunas: ")
print(merge_df.head(10))

merge_df

conn.close()