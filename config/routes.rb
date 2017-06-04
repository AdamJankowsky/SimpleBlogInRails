Rails.application.routes.draw do
  get 'welcome/index'

  root 'articles#index'

  resources :articles
  resources :pages

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  post 'articles#new_comment' => 'articles#new_comment'
  get 'articles#destroy_comment' => 'articles#destroy_comment'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
