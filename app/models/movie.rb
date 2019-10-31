class Movie < ApplicationRecord
    validates :nombre, presence: true
    validates :descripcion, presence: true
    validates :img_url, presence: true
    validates :dias_presentacion, presence: true

    has_many :reservations
end
