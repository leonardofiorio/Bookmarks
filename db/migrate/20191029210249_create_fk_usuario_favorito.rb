class CreateFkUsuarioFavorito < ActiveRecord::Migration[6.0]
  def change
  	add_column :favoritos, :usuario_id, :integer
    add_foreign_key :favoritos, :usuarios, foreign_key: true, on_delete: :cascade
  end
end
