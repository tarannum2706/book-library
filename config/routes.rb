Rails.application.routes.draw do
  resources :students
  resources :libraries
  resources :books do
    resources :checkouts
  end 

  devise_for :users
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'checkout' => 'books#checkout', :as => 'checkout'
  get '/list_checkedoutBooks' => 'books#list_checkedoutBooks', :as => 'list_checkedoutBooks'
  get '/getOverdueBooks' => 'books#getOverdueBooks', :as => 'getOverdueBooks'
  get '/viewBookHistory' => 'books#viewBookHistory', :as => 'viewBookHistory'
end
