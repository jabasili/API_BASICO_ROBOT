*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Resource   ../Payload/BodyPOST.payload.robot
Resource   ../Payload/BodyPUT.payload.robot
Resource   ../Resource/POSTBooks.resource.robot

*** Keywords ***
Criar sessão na ServeRest
    Create Session    
    ...    alias=ServerRest    
    ...    url=http://fakerestapi.azurewebsites.net/api/v1/   

Editar um livro existente
    Criar sessão na ServeRest
    ${BODY}=    Body de alteração livros
    ${RESPOSTA}    PUT On Session
    ...    alias=ServerRest
    ...    url=Books/123
    ...    json=${BODY}
    Set Test Variable    ${RESPOSTA_PUT}    ${RESPOSTA}
Ter um retorno 200 OK depois do PUT
    Editar um livro existente
    Should Be Equal As Strings    ${RESPOSTA_PUT.status_code}  200
    Set Test Variable    ${RESP_ALTERADA}    ${RESPOSTA_PUT.json()}

Validação de alteração de usuário
    ${ALTERADO}=    Create Dictionary    
    ...    title=Livro Alterado
    ...    description=Livro Alterado
    ...    pageCount=0
    ...    excerpt=0
    ...    publishDate=2023-04-10T21:24:09.989Z

    ${PAGECOUNT_ALTERADO}=    Set Variable    0
    ${ALTERADO['pageCount']}=    Convert To Integer    ${PAGECOUNT_ALTERADO}

    Should Be Equal    ${ALTERADO['title']}         ${RESP_ALTERADA['title']}
    Should Be Equal    ${ALTERADO['description']}   ${RESP_ALTERADA['description']}
    Should Be Equal    ${ALTERADO['pageCount']}     ${RESP_ALTERADA['pageCount']}
    Should Be Equal    ${ALTERADO['excerpt']}       ${RESP_ALTERADA['excerpt']}
    Should Be Equal    ${ALTERADO['publishDate']}   ${RESP_ALTERADA['publishDate']}  

Validação de criação de um livro e alteração dele
    Adicionar um novo livro
    Set Test Variable    ${RESP_CONSULTA}    ${RESPOSTA_POST.json()}
    Set Test Variable    ${ID_ALTERADO}      ${RESP_CONSULTA['id']}
    Criar sessão na ServeRest
    ${BODY}=    Body de alteração livros
    ${RESPOSTA}    PUT On Session
    ...    alias=ServerRest
    ...    url=Books/${ID_ALTERADO}
    ...    json=${BODY}
    Set Test Variable             ${RESPOSTA_PUT}    ${RESPOSTA}
    Should Be Equal As Strings    ${RESPOSTA_PUT.status_code}  200
    

    

    
