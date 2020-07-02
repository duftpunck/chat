Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :index

  resources :chat_rooms, only: [:new, :create, :show, :index, :destroy]
	
  resources :users_chats, only: [:new, :destroy] do
    collection do
      post :bulk_create
    end
  end 

  mount ActionCable.server => '/cable'
  root 'chat_rooms#index'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
