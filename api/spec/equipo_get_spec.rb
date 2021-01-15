describe "GET /equipos/{equipo_id" do
  before(:all) do
    @payload = { email: "henrique@gmail.com.br", password: "pwd123" }
    result = Sessions.new.login(@payload)
    @user_id = result.parsed_response["_id"]
  end
  context "obter unico equipo" do
    before(:all) do
      #dado que eu tenho um novo equipamento
      @payload = {
        thumbnail: Helpers::get_thumb("slash.jpg"),
        name: "Slash",
        category: "Outros",
        price: 150,
      }

      MongoDB.new.remove_equipo(@payload[:name], @user_id)

      #e eu tenho o id deste equipamento
      equipo = Equipos.new.create(@payload, @user_id)
      @equipo_id = equipo.parsed_response["_id"]

      #quando faço uma requisição get por id
      @result = Equipos.new.find_by_id(@equipo_id, @user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end

    it "deve retornar o nome" do
      expect(@result.parsed_response).to include("name" => @payload[:name])
    end
  end
end
