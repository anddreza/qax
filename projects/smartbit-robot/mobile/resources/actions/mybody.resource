*** Settings ***
Documentation    Ações e elementos da tela de envio de medidas
Library           AppiumLibrary

*** Keywords ***
Send weight and height
    
    [Arguments]    ${acccount}

    Wait Until Page Contains    Registre ou atualize suas medidas    5

    Input Text       xpath=//android.widget.EditText[@resource-id="weight"]      ${acccount}[weight]
    Input Text       xpath=//android.widget.EditText[@resource-id="height"]      ${acccount}[height]
    Click Element    xpath=//android.widget.TextView[@text="Enviar minhas medidas"]

