Dado('que estou logado como {string} e {string}') do |email, password|
    @email = email

    visit "/"
    find("input[placeholder='Seu email']").set email
    find("input[type=password]").set password
    click_button "Entrar"
end
  
Dado('que acesso o formulario de cadastro de anúncios') do
    click_button "Criar anúncio"
    # isso é um checkpoint para garantir que estou no lugar correto
    expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento:') do |table|
    #o @ serve para instanciar a variável.
    @anuncio = table.rows_hash
    #estamos utilizando o rows pois estamos fazendo tabela com, chave e valor  
    MongoDB.new.remove_equipo(@anuncio[:nome], @email)  
end
    
Quando('submeto o cadastro desse item') do

    thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

    find("#thumbnail input[type=file]", visible: false).set thumb

    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    #dessa forma estamos achando o id e depois buscando o resultado do comboBox.
    find("#price").set @anuncio[:preco]
    click_button "Cadastrar"
end
  
Então('devo ver esse item no meu Dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end