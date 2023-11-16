Rails.application.routes.draw do
  namespace "my" do
    get "wishlist", to: "wishlists#show"
    patch "wishlist", to: "wishlists#update"
  end

  get "signup", to: "users#new"
  post "signup", to: "users#create"

  get "signin", to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signin', to: 'sessions#destroy'

  resources :sales
  resources :scores
  resources :videogames do
    collection do
      get 'search'
      get 'filter'
      get 'sort'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "videogames#index"
end
