*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}     http://www.amazon.com.br
${MENU_MAIS VENDIDOS}      //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${HEADER_MAIS VENDIDOS}   //h2[contains(.,'Mais Vendidos em Eletrônicos')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser 

Acessar a home page do site Amazon.com.br
        Go To    url=${URL} 
        Wait Until Element Is Visible    locator=${MENU_MAIS VENDIDOS} 

 Entrar no menu "Mais Vendidos"
     Click Element    locator=${MENU_MAIS VENDIDOS} 

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_MAIS VENDIDOS}

Verificar se o titulo da pagina fica "${TITULO}"
    Title Should Be    title=${TITULO}

 Verificar se aparece a categoria "Novidades na Amazon"
    Element Should Be Visible    locator=//a[@href='/gp/new-releases/ref=zg_bs_tab'][contains(.,'Novidades na Amazon')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa 
     Input Text    locator=twotabsearchtextbox    text=${PRODUTO} 

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button 

Verificar o resultado pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

#Gherkin Steps

Dado que estou na home page da Amazon.com.br
     Acessar a home page do site Amazon.com.br

Quando acessar o menu "Mais Vendidos"
     Entrar no menu "Mais Vendidos" 

Então o título da página deve ficar "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon" 
     Verificar se o titulo da pagina fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"

E o texto "Mais Vendidos" deve ser exibido na página
     Verificar se aparece a frase "Mais Vendidos"

 E a categoria "Novidades na Amazon" deve ser exibida na página
     Verificar se aparece a categoria "Novidades na Amazon"
