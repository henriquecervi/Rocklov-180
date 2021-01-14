require_relative "routes/signup"

describe "POST /signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Bruna", email: "bruna@gmail.com", password: "pwd123" }

      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end
end
