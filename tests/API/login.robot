*** Settings ***
Resource    ../../utils/resource.robot


*** Test Cases ***
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
