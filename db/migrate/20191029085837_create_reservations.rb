class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :nombre_reservador
      t.string :cedula
      t.string :correo
      t.string :celular
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
    remove_index :reservations, :movie_id
    add_index :reservations, :movie_id
  end
end
