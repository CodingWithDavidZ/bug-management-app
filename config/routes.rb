Rails.application.routes.draw do
  get 'auth/index'

  post 'auth/signup'
  post 'auth/login'
  post 'auth/logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
