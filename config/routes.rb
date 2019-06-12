Rails.application.routes.draw do
  resources :products
  resources :reviews
  post '/products/:id/review/new', to: "reviews#create"
  post '/products/review',  to: "reviews#create" #{}"products#new_review", as: "reviews"
  get 'products/bookings/show', to: "bookings#show"
  get 'products/images', to: 'images#new', as: 'images'
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :bookings
    resource :images
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
