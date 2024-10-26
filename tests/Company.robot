*** Settings ***
Resource    ../resources/Company.resource
Test Setup  Abrir o navegador
Test Teardown  Fechar o navegador
Suite Teardown    Fechar o navegador
Library    Process 




*** Test Cases ***
Acessar o sistema e listar empresas cadastradas  
...  Login no sistema    
     Wait Until Page Contains   text=Logout
     Clicar na opção Cadastros
     Wait Until Page Contains   text=Cadastros
     Sleep   10
     Clicar no botão Empresa
     Sleep   10