Rails.application.routes.draw do
  resources :registered_applications
  devise_for :users, controllers: { confirmations: 'users/confirmations', sessions: 'users/sessions' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
