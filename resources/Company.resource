*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${urlBase}      https://automacao.qacoders.dev.br/login  
${emailInput}   id=email
${emailValido}  sysadmin@qacoders.com 
${senhaInput}   id=password
${senhaValida}  1234@Test
${botaoInput}   id=login
${dashboard}    id=dashboard
${EMPRESAS_XPATH}  //div[contains(@class, 'MuiListItemText-root css-1tsvksn') and contains(@id,'Cadastros')]
${CADASTROS_XPATH}  //div[contains(@class, 'MuiListItemText-root css-1tsvksn') and contains(@id,'Cadastros')]
${NOME_COLUNA_XPATH}   //div[contains(@class, 'css-wgzttu') and text()='Nome']  # XPath para a coluna "Nome"


*** Keywords ***
Abrir o navegador
    Open Browser    ${urlBase}    chrome
    Maximize Browser Window

Fechar o navegador
    Close All Browsers
Login no sistema
    Go To    url=${urlBase} 
    Wait Until Element Is Visible    locator=${emailInput} 
    Input Text                       locator=${emailInput}  text=${emailValido} 
    Wait Until Element Is Visible      locator=${senhaInput}  
    Input Password                      locator=${senhaInput}  password=${senhaValida} 
    Wait Until Element Is Visible      locator=${botaoInput}  
    Click Button  locator=${botaoInput} 


Clicar na opção Cadastros
    Wait Until Element Is Visible    ${CADASTROS_XPATH}
    Scroll Element Into View    ${CADASTROS_XPATH}
    Wait Until Element Is Enabled    ${CADASTROS_XPATH}
    Click Element    ${CADASTROS_XPATH}

Clicar no botão Empresa
    Go To    https://automacao.qacoders.dev.br/company   
    Click Element    ${EMPRESAS_XPATH}
    Sleep   10  # Aguarda 5 segundos para visualizar a tela
    Wait Until Element Is Visible    ${NOME_COLUNA_XPATH}  # Aguarda até a coluna "Nome" estar visível
