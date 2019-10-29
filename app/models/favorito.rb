class Favorito < ApplicationRecord
	
	# Validação de atributos
	validates_presence_of :url, :message => "não informada!"
	validates_presence_of :comentario, :message => "não informado!"

	# Validação do usuário
	belongs_to :usuario, class_name: "Usuario", optional: false


end
