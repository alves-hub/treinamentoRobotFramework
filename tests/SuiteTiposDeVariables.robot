*** Settings ***
Documentation    Exemplo de escopo de Variable: GLOBAIS. SUITE, TEST (Test case) e LOCAL (Keyword)
Library          String

*** Variables ***
${GLOBAL_INSTANCIADA}   Minha variavel Global foi instanciada para suite comvalor constante

*** Test Case ***
Caso de teste exemplo 01
  Uma keyword qualquer 01
  Uma keyword qualquer 02

Caso de teste exemplo 02
  uma keyword qualquer 02
  Uma keyword qualquer 03

Caso de teste exemplo 03
  Uma keyword qualquer 04


*** Keywords ***
Uma keyword qualquer 01
    ${GLOBAL_CRIADA_EM_TEMPO_DE_EXECUCAO}   Generate Random String
    #Ex. variavel "global" podendo ser utilizado em todas as suite em execução
    Set Global Variable   ${GLOBAL_CRIADA_EM_TEMPO_DE_EXECUCAO}
    #Ex. variavel "Suite" podendo ser utilizado somente nos testes da suite em execução
    Set Suite Variable    ${SUITE_CRIADA_EM_TEMPO_DE_EXECUCAO}    Variavel Suite
    #Ex. variavel "Test" pode ser utilizada dentro do teste que foi criada  em execução
    Set Test Variable    ${Test_01}    Variavel Test
    Log   ${Test_01}
    #Ex. variavel "Local" pode ser utilizada apenas na keyword em execução
    ${LOCAL}    Set Variable      variavel Local da Keyword 01

Uma keyword qualquer 02
    ${LOCAL}      Set Variable         Variável local da keyword 02
    Log   ${LOCAL}
    Log   ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_DE_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_DE_EXECUCAO} / ${LOCAL}
    # EX. A keyword abaixo vai funcionar no caso de teste 01 porem irá falhar no caso de teste 02
    #Log ${Test_01}

Uma keyword qualquer 03
    ${LOCAL}     Set Variable         JeffAlves Variavel local keyword 03
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_DE_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_DE_EXECUCAO} / ${LOCAL}

Uma keyword qualquer 04
    ${LOCAL}     Set Variable         JeffAlves Variavel local keyword 04
    Log    ${LOCAL}
