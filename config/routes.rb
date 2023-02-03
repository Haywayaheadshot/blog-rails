Rails.application.routes.draw do
  root to: 'user#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/user/:user_id/post/:user_id', to: 'post#index', as: 'show_posts'
  get '/user/:user_id/post/:user_id/comments/new', to: 'comments#new', as: 'new_comment'
  post '/user/:user_id/post/:user_id/comments', to: 'comments#create', as: 'create_comment'
  post '/user/:user_id/post/:user_id/likes', to: 'likes#create', as: 'create_like'

  resources :user,only: [:show] do 
    resources :post, only: [:index, :show]
  end

  resources :post, only: [:new, :create]
end
