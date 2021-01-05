Dado('que acesso a página de cadastro') do
    visit "http://rocklov-db:3000/signup"
end
  
Quando('submeto o meu cadastro completo') do
    find("#fullName").set "Henrique Cervi"
    find("#email").set "henrique@gmail.com"
    find("#password").set "123456"
    click_button "Cadastrar"
end
  
Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end