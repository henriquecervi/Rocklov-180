

Dado('que acesso a página de cadastro') do
    visit "http://rocklov-db:3000/signup"
end

Quando('submeto o seguinte formulário de cadastro:') do |table|

    user = table.hashes.last

    MongoDB.new.remove_user(user[:email])        

    find("#fullName").set user[:name]
    find("#email").set user[:email]
    find("#password").set user[:password]
    click_button "Cadastrar"
    
end
  
Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end

Quando('submeto o meu cadastro sem o nome') do
    find("#email").set Faker::Internet.free_email
    find("#password").set Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    click_button "Cadastrar"
end

Quando('submeto o meu cadastro sem o email') do
    find("#fullName").set Faker::Name.name_with_middle
    #find("#email").set Faker::Internet.free_email
    find("#password").set Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    click_button "Cadastrar"
end

Quando('submeto o meu cadastro com email incorreto') do
    find("#fullName").set Faker::Name.name_with_middle
    find("#email").set "henrique#gmail.com"
    find("#password").set Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    click_button "Cadastrar"
end

Quando('submeto o meu cadastro sem a senha') do
    find("#fullName").set Faker::Name.name_with_middle
    find("#email").set Faker::Internet.free_email
    #find("#password").set Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    click_button "Cadastrar"
end
  
Então('vejo a mensagem de alerta: {string}') do |validacao|
   alert = find('.alert-dark') #encontrando a classe que estamos buscando.
   expect(alert.text).to eql validacao #utilizamos o .text para "puxar" o texto que temos dentro da classe e assim conseguimos efetuar à validação
end

