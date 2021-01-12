Então('sou redirecionado para o Dashboard') do
    expect(@dash_page.on_dash?).to be true
end

Então('vejo a mensagem de alerta: {string}') do |validacao|
    expect(@alert.dark).to eql validacao 
end
 