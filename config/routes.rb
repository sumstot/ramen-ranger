Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bowls, only: [:index, :show, :new, :create, :update] do
    resources :restaurants, only: [:create]
  end

  resources :restaurants, only: [:index, :show, :update]
end
