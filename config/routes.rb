Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :jobs
  resources :applicant_profiles
  resources :applies
  resources :head_profiles
end
