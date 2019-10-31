class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :nombre
      t.text :descripcion
      t.string :img_url
      t.date :dias_presentacion

      t.timestamps
    end
  end
end
