Rails.application.routes.draw do

  root to: 'questions#index'
  devise_for :users

  resources :questions do
    resources :comments, only: [:create]
    resources :answers, only: [:create]
    resource :vote, only: [:create, :destroy]
  end

  resources :answers do
    resources :comments
    resource :vote, only: [:create, :destroy]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
