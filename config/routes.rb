Rails.application.routes.draw do

  root :to => 'homes#top'
  devise_for :users
  resources :users,only: [:show, :edit, :update, :index] do
     member do
    get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :books do
     resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
   end
  get 'home/about' => 'homes#about', as: 'about'
  get "search" => "searches#search"

end