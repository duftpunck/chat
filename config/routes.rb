Rails.application.routes.draw do
  devise_for :users
  resources :users
# root to: "home#index"
  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
  root 'chat_rooms#index'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
