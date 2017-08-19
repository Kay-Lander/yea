Rails.application.routes.draw do
  root 'application#index'

  resources :users, exclude: [:index]
  get 'users/:id' => 'users#show'
  
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy' 
  
  resources :ideas
  
  post 'likes/:id' => 'likes#create'
  delete 'likes/:id'=> 'likes#destroy'
end
