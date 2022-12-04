Rails.application.routes.draw do

  root :to => 'homes#top'
  devise_for :users
  resources :users,only: [:show, :edit, :update, :index]
  resources :books do
     resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create]
   end
  get 'home/about' => 'homes#about', as: 'about'

end