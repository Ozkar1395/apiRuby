class Reservation < ApplicationRecord
  belongs_to :movie, class_name: 'Reservation', optional: true, foreign_key: 'movie_id'
end
