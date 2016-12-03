Rails.application.routes.draw do

	# Routes for main resources
	resources :users
	resources :events
	resources :organizations
	resources :user_orgs
	resources :reimbursements 
	resources :sessions

	get 'user/edit' => 'users#edit', :as => :edit_current_user
	get 'signup' => 'users#new', :as => :signup
	get 'login' => 'sessions#new', :as => :login
	get 'logout' => 'sessions#destroy', :as => :logout

	# Root

end
