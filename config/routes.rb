Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :jobs
  resources :applicant_profiles
  resources :applies
  resources :head_profiles
  
  resources :proposals do
    resources :comments
  end
  
  resources :head_proposals do
    resources :head_comments
  end

  resources :control_users

end
