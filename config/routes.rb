Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games, only: [:index, :create, :show]

  resources :user_games, only: [:create, :destroy]

  root 'games#home'

end
