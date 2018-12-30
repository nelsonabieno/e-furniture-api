Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user do
    resources :shipping_detail
  end

  post '/login' => 'authentication#create'
  get '/logout' => 'authentication#destroy'
  post '/role' => 'role#create'
  root 'home#index'

  resources :product do
    resources :order
  end

  resources :category

  resources :cart do
    resources :product
  end

  # Todo: catch all route
  # match '*path' => 'home#path_not_found', via: :all

end
