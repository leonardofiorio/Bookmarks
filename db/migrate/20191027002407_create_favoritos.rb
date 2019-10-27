class CreateFavoritos < ActiveRecord::Migration[6.0]
  def change
    create_table :favoritos do |t|
      t.string :url
      t.text :comentario

      t.timestamps
    end
  end
end
