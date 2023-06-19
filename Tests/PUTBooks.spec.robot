*** Settings ***
Resource       ../Resource/GETBooks.resource.robot
Resource       ../Resource/POSTBooks.resource.robot
Resource       ../Resource/PUTBooks.resource.robot

*** Test Cases ***
Validação de uma chamada PUT na API de Books    
    Ter um retorno 200 OK depois do PUT
    Validação de alteração de usuário
    Validação de criação de um livro e alteração dele
