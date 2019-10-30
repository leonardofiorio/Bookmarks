require 'test_helper'

class FavoritoTest < ActiveSupport::TestCase

	setup do
		@usuario = usuarios(:one)
	end
	
	test "create favorito valid" do
		favorito = Favorito.new(
			url: "url.com.br", 
			comentario: "Meu comentário",
			usuario: @usuario
		)

		assert favorito.valid?
	end

	test "create favorito url invalid" do
		favorito = Favorito.new(
			url: "", 
			comentario: "Meu comentário",
			usuario: @usuario
		)

		assert favorito.invalid?
	end

	test "create favorito comentario invalid " do
		favorito = Favorito.new(
			url: "url.com.br", 
			comentario: "",
			usuario: @usuario
		)

		assert favorito.invalid?

	end

	test "create favorito usuario invalid" do
		favorito = Favorito.new(
			url: "url.com.br", 
			comentario: "Meu comentário",
			usuario: nil
		)

		assert favorito.invalid?
	end

end
