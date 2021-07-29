*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir navegador
Test Teardown   Fechar navegador


### SETUP ele roda keywords antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois de uma suiteou um teste

*** Test Case ***

# CT 01 : Pesquisar Produtos Existentes
#   Dado que estou na pagina home do site
#   Quando eu pesquisar pelo produto "Blouse"
#   Então o produto "Blouse" pesquisado deve ser listado na pagina resultado da busca
#
# CT 02: Pesquisar Produtos não Existentes
#    Dado que estou na pagina home do site
#    Quando eu pesquisar pelo produto "Test"
#    Então validar mensagem de erro No results were found for your search "Test"

CT 03: Inserir produto no carrinho de compra
  Dado que estou na pagina home do site
  Quando eu pesquisar pelo produto "Blouse"
  E adiciono produto "Blouse" no carrinho de compras
  Então validar que produto "Blouse" foi inserido no carrinho "Product successfully added to your shopping cart"

*** Keywords ***
