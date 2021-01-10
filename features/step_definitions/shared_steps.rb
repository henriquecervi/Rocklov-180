Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end

Então('vejo a mensagem de alerta: {string}') do |validacao|
     expect(@alert.dark).to eql validacao 
end
 