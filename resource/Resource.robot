*** Settings ***
Library    SeleniumLibrary
Library    name    *args

*** Variables ***
${URL}                                http://automationpractice.com/index.php
${BROWSER}                            firefox
${TITLE}                              My Store
${TITLE-SEARCH}                       Search - My Store
${CAMPO_PESQUISAR}                    css=#search_query_top
${BOTAO_LUPA}                         css=[name='submit_search']
${RESULTADO_BUSCA}             	      xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
${LINK_DO_PRODUTO}                    xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"Blouse")]
${BOTAO_ADICIONAR_AO_CARRINHO}        xpath=//*[@id="add_to_cart"]/button[@class="exclusive added"]/span
${PRODUTO_INEXISTENTE}                xpath=//*[@id="center_column"]//p[@class="alert alert-warning"]
${MENSAGEM_ALETA_PRODUTO_CARRINHO}    xpath=//*[@id="layer_cart"]/div[1]/div[1]/h2
${PRODUTO_NA LISTA_CARRINHO}          id=layer_cart_product_title
${BOTAO_FECHAR}                       xpath=//*[@id="layer_cart"]//span[@title="Close window"]




*** Keywords ***
### Setup e TEARDOWN
Abrir navegador
  Open Browser      about:blank  ${BROWSER}
Fechar navegador
  Sleep             4
  Close Browser

### Passo a Passso

#CT 01 : Pesquisar Produtos Existentes
Dado que estou na pagina home do site
  Go To                             ${URL}
  Wait Until Page Contains          ${TITLE}
  Title Should Be                   ${TITLE}

Quando eu pesquisar pelo produto "${PRODUTO}"
  Input Text                       ${CAMPO_PESQUISAR}    ${PRODUTO}
  Click Button                     ${BOTAO_LUPA}

Então o produto ${PRODUTO} pesquisado deve ser listado na pagina resultado da busca
  Wait Until Element Is Visible     ${RESULTADO_BUSCA}
  Title Should Be                   ${TITLE-SEARCH}
  Page Should Contain Image         ${RESULTADO_BUSCA}
  Page Should Contain Link          xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),${PRODUTO})]
  Click Link                        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),${PRODUTO})]
  Page Should Contain Button        ${BOTAO_ADICIONAR_AO_CARRINHO}

#CT 02: Pesquisar Produtos não Existentes
Então validar mensagem de erro ${MENSAGEM_ALERTA}
  Wait Until Element Is Visible     ${PRODUTO_INEXISTENTE}
  Element Text Should Be            ${PRODUTO_INEXISTENTE}    ${MENSAGEM_ALERTA}


#CT 03: Inserir produto no carrinho de compra
E adiciono produto ${PRODUTO} no carrinho de compras
  Wait Until Element Is Visible     ${RESULTADO_BUSCA}
  Title Should Be                   ${TITLE-SEARCH}
  Page Should Contain Image         ${RESULTADO_BUSCA}
  Page Should Contain Link          xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),${PRODUTO})]
  Click Link                        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),${PRODUTO})]
  Click Button                      ${BOTAO_ADICIONAR_AO_CARRINHO}

Então validar que produto ${PRODUTO} foi inserido no carrinho ${MENSAGEM_ALERTA_PR_NO_CARRINHO}
  Wait Until Element Is Visible     ${MENSAGEM_ALETA_PRODUTO_CARRINHO}
  Element Text Should Be            ${MENSAGEM_ALETA_PRODUTO_CARRINHO}    ${MENSAGEM_ALERTA_PR_NO_CARRINHO}
  Element Text Should Be            ${PRODUTO_NA LISTA_CARRINHO}          ${PRODUTO}
  Click Button                      ${BOTAO_FECHAR}
