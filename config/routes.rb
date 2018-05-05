Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations', sessions: 'users/sessions' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
