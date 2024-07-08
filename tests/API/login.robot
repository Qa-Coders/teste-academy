*** Settings ***
Resource    ../../utils/resource.robot


*** Keywords ***
Login com sucesso
    [Documentation]    Cenario de login de sucesso

    ${headers}    Create Dictionary    
    ...    Content-Type=application/json
  
    Create Session    Auth    ${env['academy']['url']}    ${headers}

    ${body}    Create Dictionary    
    ...    mail=${LoginAdmin['mail']}    
    ...    password=${LoginAdmin['password']}

    ${response}    POST On Session    Auth    ${env['academy']['endpoint']}    json=${body}
    Dictionary Should Contain Key    ${response.json()}    token
    Log    ${response.json()}

Login com email válido e senha inválida
    [Documentation]    Cenario de erro de login (email válido e senha inválida)

    ${headers}    Create Dictionary    
    ...    Content-Type=application/json
  
    Create Session    Auth    ${env['academy']['url']}    ${headers}

    ${body}    Create Dictionary    
    ...    mail=${LoginAdmin['mail']}    
    ...    password=${LoginAdmin['passwordInv']}

    ${response}    POST On Session    Auth    ${env['academy']['endpoint']}    json=${body}
    # Dictionary Should Contain Key    ${response.json()}    token
    Log    ${response.json()}

Login com email inválido e senha válida
    [Documentation]    Cenario de erro de login (email inválido e senha válida)

    ${headers}    Create Dictionary    
    ...    Content-Type=application/json
  
    Create Session    Auth    ${env['academy']['url']}    ${headers}

    ${body}    Create Dictionary    
    ...    mail=${LoginAdmin['mailInv']}    
    ...    password=${LoginAdmin['password']}

    ${response}    POST On Session    Auth    ${env['academy']['endpoint']}    json=${body}
    # Dictionary Should Contain Key    ${response.json()}    token
    Log    ${response.json()}
