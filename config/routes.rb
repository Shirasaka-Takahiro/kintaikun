Rails.application.routes.draw do
  
  root to: 'events#index'
  get 'events/index'

  resources :events

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }

  namespace :admin do
    resources :users
  end
  
  resources :users
  
end
