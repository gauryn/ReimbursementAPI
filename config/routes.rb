Rails.application.routes.draw do

  # Routes for main resources
  resources :users
  resources :events
  resources :organizations
  resources :user_orgs
  resources :reimbursements 
  resources :sessions

  # Root
  root 'home#index'

end
