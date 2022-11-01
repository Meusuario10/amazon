*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot                                                                                                                                                                                                     
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases *** 
Casos de Teste 01 - Acesso ao menu "Mais Vendidos"
    [Documentation]  Esse teste verifica o menu Mais Vendidos do site da Amazon.com.br
    ...              e verifica a categoria Eletrônicos
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Mais Vendidos" 
    Verificar se aparece a frase "Mais Vendidos" 
    Verificar se o titulo da pagina fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se aparece a categoria "Novidades na Amazon"


Casos de teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca                                                                                                                                                                                                                                                                                                                                                          
    Acessar a home page do site Amazon.com.br 
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado pesquisa se está listando o produto "Console Xbox Series S"   