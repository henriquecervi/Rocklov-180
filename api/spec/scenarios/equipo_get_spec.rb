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

  context "equipo nao existe" do
    before(:all) do
      @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
    end

    it "deve retornar 404" do
      expect(@result.code).to eql 404
    end
  end
end

describe "GET /equipos" do
  before(:all) do
    @payload = { email: "cervi@gmail.com.br", password: "pwd123" }
    result = Sessions.new.login(@payload)
    @user_id = result.parsed_response["_id"]
  end

  context "obter uma lista" do
    before(:all) do
      payloads = [{
        thumbnail: Helpers::get_thumb("sanfona.jpg"),
        name: "Sanfona",
        category: "Outros",
        price: 499,
      }, {
        thumbnail: Helpers::get_thumb("mic.jpg"),
        name: "Microfone",
        category: "Outros",
        price: 100,
      }, {
        thumbnail: Helpers::get_thumb("telecaster.jpg"),
        name: "Telecaster",
        category: "Outros",
        price: 800,
      }]

      payloads.each do |payload|
        MongoDB.new.remove_equipo(payload[:name], @user_id)
        Equipos.new.create(payload, @user_id)
      end

      @result = Equipos.new.list(@user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end

    it "deve retornar uma lista de equipos" do
      expect(@result.parsed_response).not_to be_empty
    end
  end
end
