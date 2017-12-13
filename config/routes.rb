Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'questions#index'
end
