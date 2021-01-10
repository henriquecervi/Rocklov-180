class SignupPage
  include Capybara::DSL

  def open
    visit "/signup"
  end

  def create(user) #aqui passamos apenas o USER pois estamos utilizando table e transformando ela em objeto com a variável user.
    find("#fullName").set user[:name]
    find("#email").set user[:email]
    find("#password").set user[:password]
    click_button "Cadastrar"
  end
end
