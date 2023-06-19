*** Settings ***
Resource       ../Resource/GETBooks.resource.robot
Resource       ../Resource/POSTBooks.resource.robot
Resource       ../Resource/PUTBooks.resource.robot

*** Test Cases ***
Validação de uma chamada GET na API de books
    Ter um retorno 200 OK depois do GET

