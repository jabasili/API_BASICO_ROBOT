*** Settings ***
Library    OperatingSystem
Library    RequestsLibrary
Library    String
Library    Collections
Library    BuiltIn

*** Keywords ***
Criar sessão na ServeRest
    Create Session    
    ...    alias=ServerRest    
    ...    url=http://fakerestapi.azurewebsites.net/api/v1/   

Ter um retorno 200 OK depois do GET
    Criar sessão na ServeRest
    ${RESPOSTA_CONSULTA}    GET On Session
    ...    alias=ServerRest
    ...    url=Books
    Should Be Equal As Strings    ${RESPOSTA_CONSULTA.status_code}  200
