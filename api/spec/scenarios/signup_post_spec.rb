describe "POST /signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Bruna", email: "bruna@gmail.com", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      payload = { name: "Cida", email: "cida@gmail.com", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])

      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end
    it "valida status code 409" do
      expect(@result.code).to eql 409
    end
    it "valida msg de erro" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  examples = Helpers::get_fixtures("signup")
  # fizemos o require relative no começo do arquivo para poder trabalhar com o Helpers e
  # na sequência utilizamos o modulo que criamos, agora se tivermos outra massa em outro arquivo
  # é só puxar pelo outro nome ex: examples = Helpers::get_fixtures("cadastro")

  examples.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Signup.new.create(e[:payload])
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
