Rails.application.routes.draw do
  root 'chats#index'
  devise_for :users
  mount ActionCable.server => '/cable'
end
