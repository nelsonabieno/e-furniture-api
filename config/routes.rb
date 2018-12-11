Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user
  post '/login' => 'authentication#create'
  get '/logout' => 'authentication#destroy'
  post '/role' => 'role#create'
  root 'home#index'
end
