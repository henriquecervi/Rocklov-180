#language: pt

Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

@cadastro
Cenario: Fazer cadastro
    Dado que acesso a página de cadastro
    Quando submeto o seguinte formulário de cadastro:
    | name     | email              | password  |
    | Henrique | henrique@gmail.com | pwd123    |
    | Bruna    | bruna@gmail.com    | pwd123    |
    Então sou redirecionado para o Dashboard

@tentativa_cadastro
Esquema do Cenario: Tentativa de Cadastro
    Dado que acesso a página de cadastro
    Quando submeto o seguinte formulário de cadastro:
    | name         | email         | password         |
    | <name_input> | <email_input> | <password_input> |    
    Então vejo a mensagem de alerta: "<msg_output>"

    Exemplos:
    | name_input | email_input        | password_input | msg_output                       |
    |            | henrique@gmail.com | pwd123         | Oops. Informe seu nome completo! |   
    | Henrique   |                    | pwd123         | Oops. Informe um email válido!   |   
    | Bruna      | bruna#gmail.com    | pwd123         | Oops. Informe um email válido!   |  
    | Henrique   | henrique!gmail.com | pwd123         | Oops. Informe um email válido!   | 
    | Henrique   | henrique@gmail.com |                | Oops. Informe sua senha secreta! | 