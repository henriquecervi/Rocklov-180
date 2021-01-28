describe "POST /equipos/{equipo_id}/bookings" do
  before(:all) do
    payload = { email: "cervi@gmail.com.br", password: "pwd123" }
    result = Sessions.new.login(payload)
    @cervi_id = result.parsed_response["_id"]
  end

  context "solicitar locacao" do
    before(:all) do
      # dado que o usuário tem uma "Fender Strato" para locação

      result = Sessions.new.login({ email: "joe@gmail.com", password: "pwd123" })
      joe_id = result.parsed_response["_id"]

      fender = {
        thumbnail: Helpers::get_thumb("fender-sb.jpg"),
        name: "Fender Strato",
        category: "Cordas",
        price: 150,
      }
      MongoDB.new.remove_equipo(fender[:name], joe_id)
      result = Equipos.new.create(fender, joe_id)
      fender_id = result.parsed_response["_id"]

      # quando solicito à locação da Fender

      @result = Equipos.new.booking(fender_id, @cervi_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
