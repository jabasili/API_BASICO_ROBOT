*** Settings ***
Resource       ../Resource/GETBooks.resource.robot
Resource       ../Resource/POSTBooks.resource.robot
Resource       ../Resource/PUTBooks.resource.robot

*** Test Cases ***
Validação de uma chamada POST na API de Books    
    Adicionar um novo livro
    Ter um retorno 200 OK depois do POST
    Retornar um "id"
    Retornar um "title"
    Retornar um "description"
    Retornar um "pageCount"
    Retornar um "excerpt"
    Retornar um "publishDate"