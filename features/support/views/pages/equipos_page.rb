
class EquiposPage
    include Capybara::DSL

    def create(equipo)
        # isso é um checkpoint para garantir que estou no lugar correto
        page.has_css? "#equipoForm"

        # utilizando o método upload para incluir uma foto       
        upload(equipo[:thumb]) if equipo[:thumb].length > 0 # caso seja > 0 ele vai executar o método upload.
    
        find("input[placeholder$=equipamento]").set equipo[:nome]
        find("#category").find('option', text: equipo[:categoria]).select_option
        #dessa forma estamos achando o id e depois buscando o resultado do comboBox.
        find("#price").set equipo[:preco]

        click_button "Cadastrar"
    end

    def upload(file_name)
        thumb = Dir.pwd + "/features/support/fixtures/images/" + file_name

        find("#thumbnail input[type=file]", visible: false).set thumb
    end

end