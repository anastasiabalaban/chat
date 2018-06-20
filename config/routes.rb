Rails.application.routes.draw do
  root 'chats#index'
  devise_for :users
  resources :articles
  mount ActionCable.server => '/cable'
end
