describe "POST /equipos" do
  before(:all) do
    payload = { email: "henrique@gmail.com.br", password: "pwd123" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "novo equipo" do
    thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "kramer.jpg"), "rb")
    # o "rb" quer dizer que ele deve ler somente no formato binario
    # sem ele, a imagem enviada para a requisição está vazia.
    before(:all) do
      payload = {
        thumbnail: thumbnail,
        name: "Kramer",
        category: "Cordas",
        price: 299,
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)

      @result = Equipos.new.create(payload, @user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
