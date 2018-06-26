Rails.application.routes.draw do
  root 'chats#index'
  devise_for :users
  resources :articles, only: [:index, :show, :new, :create]
  mount ActionCable.server => '/cable'
end
