require_relative "base_api"

class Equipos < BaseApi
  def create(payload, user_id)

    #self.class é ter acesso aos objetos da própria classe
    return self.class.post(
             "/equipos",
             body: payload, #não utilizamos json, pois estamos enviando a foto junto
             headers: {
               "user_id": user_id, #neste caso não precisamos do application json /\
             },
           )
  end
end
