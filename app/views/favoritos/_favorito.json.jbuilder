json.extract! favorito, :id, :url, :comentario, :created_at, :updated_at
json.url favorito_url(favorito, format: :json)
