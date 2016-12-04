Rails.application.routes.draw do

	# Routes for main resources
	resources :users
	resources :events
	resources :organizations
	resources :user_orgs
	resources :reimbursements 
	resources :sessions

	get 'login' => 'sessions#create', :as => :login
	get 'logout' => 'sessions#destroy', :as => :logout

	# Root

end
