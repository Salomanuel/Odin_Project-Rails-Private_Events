Rails.application.routes.draw do

	root 'sessions#new'

	resources :users, 		only: [:show, :new, :create]
	resources :sessions, 	only: [:new, :create, :destroy]

	get  		'signup', to: 'users#new'
	post 		'signup', to: 'users#create'

	get			'login',	to: 'sessions#new'
	post		'login',	to: 'sessions#create'
	delete	'logout',	to: 'sessions#destroy'
end
