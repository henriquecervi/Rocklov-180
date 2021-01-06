Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end

Então('vejo a mensagem de alerta: {string}') do |validacao|
    alert = find('.alert-dark') #encontrando a classe que estamos buscando.
    expect(alert.text).to eql validacao #utilizamos o .text para "puxar" o texto que temos dentro da classe e assim conseguimos efetuar à validação
end
 