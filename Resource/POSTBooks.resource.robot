*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Resource   ../Payload/BodyPOST.payload.robot

*** Keywords ***
Criar sessão na ServeRest
    Create Session    
    ...    alias=ServerRest    
    ...    url=http://fakerestapi.azurewebsites.net/api/v1/   

Adicionar um novo livro
    Criar sessão na ServeRest
    ${BODY}=    Body de criação livros
    ${RESPOSTA}    POST On Session
    ...    alias=ServerRest
    ...    url=Books
    ...    json=${BODY}
    Set Test Variable    ${RESPOSTA_POST}    ${RESPOSTA}
Ter um retorno 200 OK depois do POST
    Adicionar um novo livro
    Should Be Equal As Strings    ${RESPOSTA_POST.status_code}  200
    Set Test Variable    ${RESP_CONSULTA}    ${RESPOSTA_POST.json()}

Retornar um "id"
    Should Not Be Empty    ${RESP_CONSULTA}    id
Retornar um "title"
    Should Not Be Empty    ${RESP_CONSULTA}    title
Retornar um "description"
    Should Not Be Empty    ${RESP_CONSULTA}    description
Retornar um "pageCount"
    Should Not Be Empty    ${RESP_CONSULTA}    pageCount
Retornar um "excerpt"
    Should Not Be Empty    ${RESP_CONSULTA}    excerpt
Retornar um "publishDate"
    Should Not Be Empty    ${RESP_CONSULTA}    publishDate