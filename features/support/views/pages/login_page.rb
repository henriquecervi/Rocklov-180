class LoginPage
  include Capybara::DSL #utilizar todos os recursos do Capybara.

  def open
    visit "/"
  end

  def with(email, password)
    find("input[placeholder='Seu email']").set email
    find("input[type=password]").set password
    click_button "Entrar"
  end
end
