require_relative "routes/sessions"

#suit
describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do
      payload = { email: "henrique@gmail.com.br", password: "pwd123" }
      @result = Sessions.new.login(payload)
    end
    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuario" do
      expect(@result.parsed_response["_id"].length).to eql 24
      #usamos o parsed para transformar em hash e o 24 é o resultado que o mongo sempre vai retornar

    end
  end

  examples = [
    {
      title: "senha incorreta",
      payload: { email: "henrique@gmail.com.br", password: "12345" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "email invalido",
      payload: { email: "404@gmail.com.br", password: "12345" },
      code: 401,
      error: "Unauthorized",
    },
    {
      title: "email nao preenchido",
      payload: { email: "", password: "12345" },
      code: 412,
      error: "required email",
    },
    {
      title: "sem o campo email",
      payload: { password: "12345" },
      code: 412,
      error: "required email",
    },
    {
      title: "senha nao preenchida",
      payload: { email: "henrique@gmail.com.br", password: "" },
      code: 412,
      error: "required password",
    },
    {
      title: "sem o campo senha",
      payload: { email: "henrique@gmail.com.br" },
      code: 412,
      error: "required password",
    },

  ]

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
      end
      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "valida msg de retorno" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
