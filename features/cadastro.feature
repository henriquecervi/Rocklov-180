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
Cenario: Submeter cadastro sem o nome
    Dado que acesso a página de cadastro
     Quando submeto o seguinte formulário de cadastro:
    | name     | email              | password  |
    |          | henrique@gmail.com | pwd123    |
    |          | bruna@gmail.com    | pwd123    |
    Então vejo a mensagem de alerta: "Oops. Informe seu nome completo!"

@tentativa_cadastro
Cenario: Submeter cadastro sem o email
    Dado que acesso a página de cadastro
     Quando submeto o seguinte formulário de cadastro:
    | name     | email | password  |
    | Henrique |       | pwd123    |
    | Bruna    |       | pwd123    |
    Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

@tentativa_cadastro
Cenario: Submeter cadastro com email incorreto
    Dado que acesso a página de cadastro
     Quando submeto o seguinte formulário de cadastro:
    | name     | email              | password  |
    | Henrique | henrique#gmail.com | pwd123    |
    | Bruna    | bruna%gmail.com    | pwd123    |
    Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

@tentativa_cadastro
Cenario: Submeter cadastro sem a senha
    Dado que acesso a página de cadastro
    Quando submeto o seguinte formulário de cadastro:
    | name     | email              | password  |
    | Henrique | henrique@gmail.com |           |
    | Bruna    | bruna@gmail.com    |           |
    Então vejo a mensagem de alerta: "Oops. Informe sua senha secreta!"
