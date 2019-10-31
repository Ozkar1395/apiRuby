Rails.application.routes.draw do
  resources :reservations
  resources :movies

  get '/reservar', to: 'movies#mostrar_reservas'
  get '/reservas/:id', to: 'reservations#reservarBymovies'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
