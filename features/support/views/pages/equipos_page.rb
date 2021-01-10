
class EquiposPage
    include Capybara::DSL

    def create(equipo)
        # isso é um checkpoint para garantir que estou no lugar correto
        page.has_css? "#equipoForm"

        
        
        thumb = Dir.pwd + "/features/support/fixtures/images/" + equipo[:thumb]

        find("#thumbnail input[type=file]", visible: false).set thumb
    
        find("input[placeholder$=equipamento]").set equipo[:nome]
        find("#category").find('option', text: equipo[:categoria]).select_option
        #dessa forma estamos achando o id e depois buscando o resultado do comboBox.
        find("#price").set equipo[:preco]

        click_button "Cadastrar"
    end

end