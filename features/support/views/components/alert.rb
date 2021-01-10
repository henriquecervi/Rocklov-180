class Alert
  include Capybara::DSL

  def dark
    return find(".alert-dark").text  #encontrando a classe que estamos buscando.
    #utilizamos o .text para "puxar" o texto que temos dentro da classe e assim conseguimos efetuar à validação
  end
end
