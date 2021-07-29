*** Settings ***
Documentation    Exemplo de escopo de Variable: GLOBAIS. SUITE, TEST (Test case) e LOCAL (Keyword)
Library          String

*** Variables ***
#TIPO DE DICIONÁRIO
&{PESSOA}    nome=Jeffeson    email=jefferson.alv35@outlook   idade=32    sexo=masculino

*** Test Case ***
Caso de teste exemplo 01
  Uma keyword qualquer 01



*** Keywords ***
Uma keyword qualquer 01
    Uma Subkeyword com argumentos  ${PESSOA.nome}   ${PESSOA.email}
    ${MENSAGEM_ALERTA}    Uma subkeyword com retorno   ${PESSOA.nome}  ${PESSOA.idade}   ${PESSOA.sexo}
    Log    ${MENSAGEM_ALERTA}

Uma Subkeyword com argumentos
    [Arguments]   ${NOME_USUARIO}   ${EMAIL_USUARIO}
    Log           Nome do usuário: ${NOME_USUARIO}
    Log           Email do usuário: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]   ${NOME_USUARIO}  ${IDADE_USUARIO}    ${SEXO_USUARIO}
    ${MENSAGEM}   Set Variable If    ${IDADE_USUARIO} >=50    O Usuário ${NOME_USUARIO} do sexo ${SEXO_USUARIO} Não deve receber vacina do covid!
    [Return]      ${MENSAGEM}
