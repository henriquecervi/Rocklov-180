require_relative "routes/sessions"

#suit
describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do
      @result = Sessions.new.login("henrique@gmail.com.br", "pwd123")
    end
    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuario" do
      expect(@result.parsed_response["_id"].length).to eql 24
      #usamos o parsed para transformar em hash e o 24 é o resultado que o mongo sempre vai retornar

    end
  end

  context "senha invalida" do
    before(:all) do
      @result = Sessions.new.login("henrique@gmail.com.br", "12345")
    end
    it "valida status code" do
      expect(@result.code).to eql 401
    end

    it "valida msg de retorno" do
      expect(@result.parsed_response["error"]).to eql "Unauthorized"
    end
  end
end
