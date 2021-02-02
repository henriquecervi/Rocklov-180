Dado("Login com {string} e {string}") do |email, password|
  @email = email

  @login_page.open
  @login_page.with(email, password)
  expect(@dash_page.on_dash?).to be true
end

Dado("que acesso o formulario de cadastro de anúncios") do
  @dash_page.goto_equipo_form
end

Dado("que eu tenho o seguinte equipamento:") do |table|
  #o @ serve para instanciar a variável.
  @anuncio = table.rows_hash
  #estamos utilizando o rows pois estamos fazendo tabela com, chave e valor
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipos_page.create(@anuncio)
end

Então("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então("deve conter a mensagem de alerta: {string}") do |validacao|
  expect(@alert.dark).to have_text validacao
end

# remover anúncios

Dado("que eu tenho um anúncio indesejado:") do |table|
  user_id = page.execute_script("return localStorage.getItem('user')")

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images",
                                  table.rows_hash[:thumb]), "rb")

  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  EquiposService.new.create(@equipo, user_id)

  visit current_path #ele da um f5 na página, pois como estamos cadastrando
  #via api, a web não consegue visualizar sem dar f5.
end

Quando("eu solicito a exclusão desse item") do
  @dash_page.request_removal(@equipo[:name])
  sleep 1 #think time
end

Quando("confirmo a exclusão") do
  @dash_page.confirm_removal
end

Então("não devo ver esse item no meu Dashboard") do
  expect(
    @dash_page.has_no_equipo?(@equipo[:name])
  ).to be true
end
