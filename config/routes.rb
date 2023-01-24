Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'bowls/hall_of_fame' => 'bowls#hall_of_fame'

  resources :bowls, only: [:index, :show, :new, :create, :update] do
    resources :restaurants, only: [:create]
  end

  resources :restaurants, only: [:index, :show, :update]
end
