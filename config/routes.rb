Rails.application.routes.draw do
  
  root to: 'events#index'
  get 'events/index'

  resources :events do
    collection { post :import }
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :admin do
    resources :users
  end
  
  resources :users

end
