Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices
  get '/products' => 'products#index'
  post '/products' => 'products#create'
  get '/products/new' => 'products#new'
  get '/products/:id/more' => 'products#more'
  get '/products/:id/description' => 'products#description'
  get '/products/:id/inventory' => 'products#inventory'
end
