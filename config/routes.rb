Rails.application.routes.draw do
	resources :teams
	resources :comments
	resources :projects
	resources :bugs
	resources :users

	post '/register', to: 'users#create'

	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	get '/test', to: 'sessions#test'

	# Routing logic: fallback requests for React Router.
	# Leave this here to help deploy your app later!
	get '*path',
	    to: 'fallback#index',
	    constraints: ->(req) { !req.xhr? && req.format.html? }
end
