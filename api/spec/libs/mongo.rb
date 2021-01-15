require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  attr_accessor :users, :equipos #< são as collections do mongo

  def initialize #já inicializa
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos] #equipos é o nome da collection do MONGODB que estamos manipulando!
  end

  def remove_user(email)
    @users.delete_many({ email: email })
  end

  # criamos esse método para conseguir selecionar o usuário correto, sendo assim não temos um falso positivo.
  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remove_equipo(name, user_id)
    object_id = BSON::ObjectId.from_string(user_id)
    @equipos.delete_many({ name: name, user: object_id })
  end

  def get_mongo_id
    return BSON::ObjectId.new
  end
end
