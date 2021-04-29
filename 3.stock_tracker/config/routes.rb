Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#index"  
  get "my_portfolio", to: "users#my_portfolio"
  get "search_stock", to: "stocks#search"
  get "friends_list", to: "users#friends_list"
  get "search_friends", to: "users#search_for_friend"
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
end
