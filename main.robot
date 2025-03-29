*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${EMAIL-NEW}                    cc@proxima.com
${PASSWORD-NEW}                 1345
${EMAIL-V}                      usuario@teste.com
${PASSWORD-v}                   Teste@1234
${PASSWORD-E}                   intelbras
${EMAIL-E}                      intelbras
${EMAIL-I}                      intelbras@intelbras.com
${BROWSER}                      Chrome
${URL}                          https://teste-estagiarios.vercel.app/
${BUTTON-PBA}                   Link:Password-based Authentication.
${TIME}                         1
${INPUT-LE}                     //input[@class='mt-1 p-2 w-full border rounded-md focus:outline-none focus:ring focus:border-blue-300 dark:bg-gray-700 dark:text-gray-100 dark:border-gray-600' and @type='email']
${INPUT-LP}                     //input[@class='mt-1 p-2 w-full border rounded-md focus:outline-none focus:ring focus:border-blue-300 dark:bg-gray-700 dark:text-gray-100 dark:border-gray-600' and @type='password']
${BUTTON-SUBMIT}                //button[@type='submit']
${INVALID-LOGIN}                //p[@class='text-center mt-4 text-red-500']
${LINK-CREATE}                  Link:Create a new account
${MSG-LOGIN-SUCCESSFUL-01}      //p[@class='text-green-500 text-center text-lg font-semibold']
${MSG-LOGIN-SUCCESSFUL-02}      //p[@class='text-center mt-4 text-green-500']
${MSG-SIGNU}                    //p[@class='text-center mt-4 text-green-500']
${BACK-LOGIN}                   LINK:Back to login

*** Keywords ***
Password-based Authentication
    Sleep                       ${TIME}
    Click Link                  ${BUTTON-PBA}
    Sleep                       ${TIME}

CRIAR-CONTA
    Input Text                  ${INPUT-LE}   ${EMAIL-NEW}
    Input Password              ${INPUT-LP}   ${PASSWORD-NEW}
    Click Button                ${BUTTON-SUBMIT}

CRIAR-CONTA-PASSWORD-ERRADA
    Input Text                  ${INPUT-LE}   ${EMAIL-V}
    Input Password              ${INPUT-LP}   ${PASSWORD-E}
    Click Button                ${BUTTON-SUBMIT}

CRIAR-CONTA-EMAIL-ERRADA
    Input Text                  ${INPUT-LE}   ${EMAIL-E}
    Input Password              ${INPUT-LP}   ${PASSWORD-v}
    Click Button                ${BUTTON-SUBMIT}

Validetion
    Sleep                       ${TIME}
    Element Should Be Visible   ${MSG-LOGIN-SUCCESSFUL-01}
    Element Should Be Visible   ${MSG-SIGNU}
    Element Should Be Visible   ${BACK-LOGIN}

Abrir navegador
    Open Browser                 ${URL}  ${BROWSER}

Fechar navegador
    Close Browser

Click-Link 
    Click Link                   ${LINK-CREATE}
    Sleep                        ${TIME}

Click-Button
    Click Button                 ${BUTTON-SUBMIT}

Validar-Campos
    Sleep                        ${Time}
    Element Should Be Visible    ${INPUT-LE}
    Element Should Be Visible    ${INPUT-LP}
    Sleep                        ${Time}


Login-Passed
    Input Text                   ${INPUT-LE}   ${EMAIL-V}
    Input Password               ${INPUT-LP}   ${PASSWORD-v}
    Sleep                        ${TIME}
    Click Button                 ${BUTTON-SUBMIT}
    Sleep                        ${TIME}


Validar-Login
    Sleep                        ${TIME}
    Element Should Be Visible    ${MSG-LOGIN-SUCCESSFUL-01}
    Element Should Be Visible    ${MSG-LOGIN-SUCCESSFUL-02}

Login-failed
    Input Text                   ${INPUT-LE}   ${EMAIL-I}
    Input Password               ${INPUT-LP}   ${PASSWORD-E}
    Sleep                        ${TIME}
    Click Button                 ${BUTTON-SUBMIT}

Validar-Login-failed
    Sleep                        ${TIME}
    Element Should Be Visible    ${INVALID-LOGIN}

Login-nao-existente
    Input Text                   ${INPUT-LE}   ${EMAIL-I}
    Input Password               ${INPUT-LP}   ${PASSWORD-v}
    Sleep                        ${TIME}
    Click Button                 ${BUTTON-SUBMIT}
    Sleep                        ${TIME}


Teste-login-passed
    Input Text                   ${INPUT-LE}   ${EMAIL-V}
    Input Password               ${INPUT-LP}   ${PASSWORD-v}
    Sleep                        ${TIME}
    Click Button                 ${BUTTON-SUBMIT}
    Sleep                        ${TIME}
    Element Should Be Visible    ${MSG-LOGIN-SUCCESSFUL-01}
    Element Should Be Visible    ${MSG-LOGIN-SUCCESSFUL-02}
    Sleep                        ${TIME}

*** Test Cases ***      

Cenario 1 (Cadastro)- Cadastro bem-sucedido
    [tags]   Event
    Abrir navegador
    Password-based Authentication
    Click-Link
    CRIAR-CONTA
    Validetion
    Fechar navegador

Cenário 2 (Cadastro) - Campos obrigatórios
    [tags]   Event
    Abrir navegador
    Password-based Authentication
    Click-Link
    Click-Button
    Validar-Campos
    Fechar navegador

Cenário 3 (Cadastro) - Validação do formato do E-mail:
    [tags]   Event
    Abrir navegador
    Password-based Authentication
    Click-Link
    CRIAR-CONTA-EMAIL-ERRADA
    Validar-Campos
    Fechar navegador

Cenário 4 (Login) - Login bem-sucedido:
    [tags]   Event
    Abrir navegador
    Password-based Authentication
    Login-Passed
    Validar-Login
    Fechar navegador

Cenário 5 (Login) - Login com credenciais erradas:
    [tags]   Event
    Abrir navegador
    Password-based Authentication
    Login-failed
    Validar-Login-failed
    Fechar navegador

Cenário 6 (Login) - Login com conta inexistente:
    [Tags]   Event
    Abrir navegador
    Password-based Authentication
    Login-nao-existente
    Validar-Login-failed
    Fechar navegador