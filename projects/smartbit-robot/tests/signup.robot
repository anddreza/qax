*** Settings *** 
Documentation        Teste para verificar o Slogan da Smartbit

Library    Browser

Resource    ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente
    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    
    New Page    http://localhost:3000

    Get Text
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!   
        
    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       ${account}[email]
    Fill Text    id=document    ${account}[document]  

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    text=Falta pouco para fazer parte da família Smartbit!    
    ...    visible     5
        
Campo nome deve ser obrigatório
    [Tags]        required
    
    New Browser    browser=chromium    headless=True
    
    New Page    http://localhost:3000

    Get Text
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!   
        
    Fill Text    id=email       papito@teste.com.br
    Fill Text    id=document    75400440045  

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice 
    ...    visible     5
    
    Get Text    
    ...    css=form .notice
    ...    equal
    ...    Por favor informe o seu nome completo
    ...    

Campo email deve ser obrigatório
    [Tags]        required
    
    New Browser    browser=chromium    headless=True
    
    New Page    http://localhost:3000

    Get Text
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!   
        
    Fill Text    id=name        Fernando Papito
    Fill Text    id=document    75400440045  

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice 
    ...    visible     5
    
    Get Text    
    ...    css=form .notice
    ...    equal
    ...    Por favor, informe o seu melhor e-mail    

Campo cpf deve ser obrigatório
    [Tags]        required
    
    New Browser    browser=chromium    headless=True
    
    New Page    http://localhost:3000

    Get Text
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!   
        
    Fill Text    id=name        Fernando Papito
    Fill Text    id=email       papito@teste.com.br
    

    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice 
    ...    visible     5
    
    Get Text    
    ...    css=form .notice
    ...    equal
    ...    Por favor, informe o seu CPF 

Email no formato incorreto
    [Tags]        inv
    
    New Browser    browser=chromium    headless=True
    
    New Page    http://localhost:3000

    Get Text
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!   
        
    Fill Text    id=name        Fernando Papito
    Fill Text    id=email       papito*teste.com.br
    Fill Text    id=document    75400440045  


    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice 
    ...    visible     5
    
    Get Text    
    ...    css=form .notice
    ...    equal
    ...    Oops! O email informado é inválido

CPF no formato inválido
    [Tags]        inv
    
    New Browser    browser=chromium    headless=True
    
    New Page    http://localhost:3000

    Get Text
    ...    css=#signup h2    
    ...    equal    
    ...    Faça seu cadastro e venha para a Smartbit!   
        
    Fill Text    id=name        Fernando Papito
    Fill Text    id=email       papito@teste.com.br
    Fill Text    id=document    000000000aa  


    Click    css=button >> text=Cadastrar

    Wait For Elements State    
    ...    css=form .notice 
    ...    visible     5
    
    Get Text    
    ...    css=form .notice
    ...    equal
    ...    Oops! O CPF informado é inválido

*** Keywords ***
Submit signup form
