Dado('que acesso a página de cadastro') do
    visit "http://rocklov-db:3000/signup"
end
  
Quando('submeto o meu cadastro completo') do
    find("#fullName").set Faker::Name.name_with_middle
    find("#email").set Faker::Internet.free_email
    find("#password").set Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    click_button "Cadastrar"
end
  
Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end