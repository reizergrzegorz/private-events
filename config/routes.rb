Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    get "users/sign_out" => "users/sessions#destroy"
  end
  root "events#index"
  resources :events
  resources :users, only: [:show]
end
