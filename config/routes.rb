Rails.application.routes.draw do
  resources :products
  resources :reviews
  post '/products/:id/review/new', to: "reviews#create"
  post '/products/review',  to: "reviews#create" #{}"products#new_review", as: "reviews"
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :bookings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
