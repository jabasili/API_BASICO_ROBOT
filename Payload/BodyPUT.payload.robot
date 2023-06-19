*** Settings ***
Library    OperatingSystem
Library    Collections

*** Keywords ***
Body de alteração livros
    ${BODY}    Create Dictionary
    ...    id=123
    ...    title=Livro Alterado
    ...    description=Livro Alterado    
    ...    pageCount=0
    ...    excerpt=0    
    ...    publishDate=2023-04-10T21:24:09.989Z
    RETURN    ${BODY}   
