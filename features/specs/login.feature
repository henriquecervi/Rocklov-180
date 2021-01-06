#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da RockLov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "henrique@gmail.com.br" e "pwd123"
        Então sou redirecionado para o Dashboard
    

    Esquema do Cenario: Login sem sucesso
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<password_input>"
        Então vejo a mensagem de alerta: "<msg_output>"

        Exemplos:

            | email_input        | password_input | msg_output                       |
            | henrique@gmail.com | pwd12          | Usuário e/ou senha inválidos.    |
            | henrique@terra.com | pwd123         | Usuário e/ou senha inválidos.    |
            | henrique!gmail.com | pwd123         | Oops. Informe um email válido!   |
            |                    | pwd123         | Oops. Informe um email válido!   |
            | henrique@gmail.com |                | Oops. Informe sua senha secreta! |