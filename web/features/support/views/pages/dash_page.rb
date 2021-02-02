class DashPage
  include Capybara::DSL

  def on_dash?
    return page.has_css?(".dashboard")
  end

  def goto_equipo_form
    click_button "Criar anúncio"
  end

  def equipo_list
    return find(".equipo-list")
  end

  def has_no_equipo?(name)
    return page.has_no_css?(".equipo-list li", text: name)
  end

  def request_removal(name)
    #estamos utilizando essa estratégia de busca,
    #pois caso tenhamos mais de 1 item cadastrado,
    #iremos excluir "todos"
    equipo = find(".equipo-list li", text: name)
    equipo.find(".delete-icon").click
  end

  def confirm_removal
    click_on "Sim"
  end
end
