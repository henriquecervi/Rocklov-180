require "httparty"

class Sessions
  include HTTParty
  base_uri "http://rocklov-api:3333"

  def login(payload)

    #self.class é ter acesso aos objetos da própria classe
    return self.class.post(
             "/sessions",
             body: payload.to_json,
             headers: {
               "Content-Type": "application/json",
             },
           )
  end
end
