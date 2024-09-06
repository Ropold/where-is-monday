Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :cats
  resources :sightings
  get "my_cats", to: "cats#my_cats"
  get "sightings_step1", to: "sightings#step1"
  get "sightings_step2", to: "sightings#step2"
end
