Rails.application.routes.draw do
  root 'welcome#index'
 
  resources :comments
  resources :posts
  resources :subreddits
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
