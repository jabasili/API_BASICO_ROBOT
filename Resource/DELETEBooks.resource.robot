*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Resource   ../Resource/POSTBooks.resource.robot

*** Keywords ***
Criar sessão na ServeRest
    Create Session    
    ...    alias=ServerRest    
    ...    url=http://fakerestapi.azurewebsites.net/api/v1/   

Ter um retorno 200 depois do Delete
    Criar sessão na ServeRest
    ${RESPOSTA_DELETE}    Delete On Session
    ...    alias=ServerRest
    ...    url=Books/123
    Should Be Equal As Strings    ${RESPOSTA_DELETE.status_code}  200

Criar e deletar um livro
    Adicionar um novo livro
    Set Test Variable    ${RESP_CONSULTA}    ${RESPOSTA_POST.json()}
    Set Test Variable    ${ID_PARA_DELETE}      ${RESP_CONSULTA['id']}
    Criar sessão na ServeRest
    ${RESPOSTA_DELETE}    Delete On Session
    ...    alias=ServerRest
    ...    url=Books/${ID_PARA_DELETE} 
    Set Test Variable             ${RESPOSTA_DEL}    ${RESPOSTA_DELETE}
    Should Be Equal As Strings    ${RESPOSTA_DEL.status_code}  200
