*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar sessão
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    LoginTest    https://develop.qacoders-academy.com.br    ${headers}

Fazer login
    ${body}    Create Dictionary    mail=sysadmin@qacoders.com    password=1234@Test
    Criar sessão
    ${response}=    POST On Session    LoginTest    /api/login/    json=${body}
    Dictionary Should Contain Key    ${response.json()}    token
    Log    ${response.json()}