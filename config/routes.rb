Rails.application.routes.draw do

	# Routes for main resources
	resources :users
	# resources :events
	resources :organizations
	resources :user_orgs
	resources :reimbursements 
	resources :sessions

	get 'login' => 'sessions#create', :as => :login
	get 'logout' => 'sessions#destroy', :as => :logout
	get 'requests_for_user/:user_id' => 'reimbursements#get_requests_for_user', :as => :requests_for_user
	get 'orgs_for_user/:user_id' => 'user_orgs#get_orgs_for_user', :as => :orgs_for_user

end
