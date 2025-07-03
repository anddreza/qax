*** Settings *** 
Documentation        Teste para verificar o Slogan da Smartbit

Library    Browser

*** Test Cases ***
Deve iniciar o cadastro do cliente
    New Browser    browser=chromium    headless=True
    New Page    http://localhost:3000
    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!   
    Fill Text    id=name        Fernando Papito
    Fill Text    id=email       papito@gmail.com
    Fill Text    id=document    00000000000

    Click    xpath=//button[text()="Cadastrar"]
    Click    text=Cadastrar
    