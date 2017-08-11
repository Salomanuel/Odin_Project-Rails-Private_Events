Rails.application.routes.draw do

	root 'sessions#new'

	resources :users, 		only: [:new, :create, :index, :show]
	resources :sessions, 	only: [:new, :create, :destroy]
	resources :events,		only: [:new, :create, :index, :show]

	get  		'signup', to: 'users#new'
	post 		'signup', to: 'users#create'

	get			'login',	to: 'sessions#new'
	post		'login',	to: 'sessions#create'
	delete	'logout',	to: 'sessions#destroy'
end
