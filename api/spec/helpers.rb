module Helpers
  def get_fixtures(item)
    YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true)
  end

  def get_thumb(file_name)
    return File.open(File.join(Dir.pwd, "spec/fixtures/images", file_name), "rb")
    # o "rb" quer dizer que ele deve ler somente no formato binario
    # sem ele, a imagem enviada para a requisição está vazia.
  end

  module_function :get_fixtures
  module_function :get_thumb
end
