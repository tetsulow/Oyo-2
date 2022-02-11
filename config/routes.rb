Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 devise_for :users
  root :to =>"homes#top"
  get "home/top"=>"homes#top"
  get "home/about"=>"homes#about"

  resources :chats, only: [:show, :create]
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  get '/search', to: 'searches#search'
  get 'chats/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
