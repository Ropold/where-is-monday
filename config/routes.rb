Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :cats do
    member do
      patch "found", to: "cats#found"
    end
    collection do
      post "nearby", to: "cats#nearby"
    end
    resources :sightings, only: [:new, :create, :edit, :update] do
      member do
        patch "accept", to: "sightings#accept"
        patch "reject", to: "sightings#reject"
      end
    end
  end

  resources :sightings, only: [:destroy]
  get "add_sighting", to: "sightings#add_sighting"
  post 'sightings/create', to: 'sightings#create', as: 'create_sighting'

  get "my_cats", to: "cats#my_cats"
  get "sightings_step1", to: "sightings#step1"
end
