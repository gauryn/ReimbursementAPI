Rails.application.routes.draw do

  # Routes for main resources
  resources :users, except: [:new, :edit]
  resources :events, except: [:new, :edit]
  resources :organizations, except: [:new, :edit]
  resources :user_orgs, except: [:new, :edit]
  resources :reimbursements, except: [:new, :edit]  
  resources :sessions

end
