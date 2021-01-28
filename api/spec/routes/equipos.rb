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

  def booking(equipo_id, user_locator_id)
    return self.class.post(
             "/equipos/#{equipo_id}/bookings",
             # o strftime serve para escolhermos o formato da data
             body: { date: Time.now.strftime("%d/%m/%Y") }.to_json,
             headers: {
               "user_id": user_locator_id,
             },
           )
  end

  def find_by_id(equipo_id, user_id)
    return self.class.get(
             "/equipos/#{equipo_id}",
             headers: {
               "user_id": user_id,
             },
           )
  end

  def list(user_id)
    return self.class.get(
             "/equipos",
             headers: {
               "user_id": user_id,
             },
           )
  end

  def remove_by_id(equipo_id, user_id)
    return self.class.delete(
             "/equipos/#{equipo_id}",
             headers: {
               "user_id": user_id,
             },
           )
  end
end
