*** Settings ***
Documentation    Exemplo de escopo de Variable: GLOBAIS. SUITE, TEST (Test case) e LOCAL (Keyword)
Library          String

*** Variables ***
#Simples
${GLOBAL_INSTANCIADA}   Minha variavel Global foi instanciada para suite comvalor constante

#TIPO DE LISTA
@{FAMILIA}    Jeffeson Alves   Daiany Alves  Davi Alves  Arthur Modesto   Theo Rocha

#TIPO DE LISTA
&{PESSOA}    nome=Jeffeson    email=jefferson.alv35@outlook   idade=28    sexo=masculino

*** Test Case ***
Caso de teste exemplo 01
  Uma keyword qualquer 01



*** Keywords ***
Uma keyword qualquer 01
  #Variavel Simples
  Log   ${GLOBAL_INSTANCIADA}

  #TIPO DE LISTA
  Log    Exibir o nome da Mãe: ${FAMILIA[1]} e tambem o nome do Pai: ${FAMILIA[0]}

  #TIPO DE LISTA
  Log    Exibir o E-mail: ${PESSOA.email} e em seguida exibir o sexo: ${PESSOA.sexo}    
