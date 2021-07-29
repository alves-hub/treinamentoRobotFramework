*** Settings ***
Resource        ../resource/Resource.robot
Library    Selenium
*** Variables ***
${URL}    http://automationpractice.com/index.php
${BROWSER}    chrome

***Test Case***

CT 01 : Pesquisar Produtos Existentes
  Acessar pagina home do site
  Conferir se a pagina home foi exibida
  Digitar o nome do produto "Blouse"
  Clicar no botão pesquisar
  Conferir se o produto "Blouse" foi listadono site

CT 02: Pesquisar Produtos não Existentes
  Acessar pagina home do site
  Conferir se a pagina home foi exibida
  Digitar o nome do produto "itemNãoExistente"
  Clicar no botão pesquisar
  Conferir mensagem de erro "No Results were found for your search "itemNãoExistente""

***Keywords***
