Rails.application.routes.draw do

	resources :users

	get  'signup', to: 'users#new'
	post 'signup', to: 'users#create'
end
