#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizados para locação

    Contexto: Login
        * Login com "henrique@yahoo.com.br" e "pwd123"

    Cenario: Novo equipo
        Dado que acesso o formulario de cadastro de anúncios

            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard

    @temp
    Cenario: Tentativa de cadastro de anúncios
        Dado que acesso o formulario de cadastro de anúncios

            E que eu tenho o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"

        Exemplos:

            | foto         | nome      | categoria | preco | saida                                |
            |              | Kamer     | Cordas    | 200   | Adicione uma foto no seu anúncio!    |
            | conga.jpg    |           | Baterias  | 120   | Informe a descrição do anúncio!      |
            | trompete.jpg | Trompete  |           | 450   | Informe a categoria                  |
            | sanfona.jpg  | Sanfona   | Teclas    |       | Informe o valor da diária            |
            | mic.jpg      | Microfone | Outros    | 100a  | O valor da diária deve ser numérico! |
            | violino.jpg  | Violino   | Outros    | abc   | O valor da diária deve ser numérico! |