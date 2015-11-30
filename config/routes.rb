Rails.application.routes.draw do
  
  get 'about' => 'pages#about'
  resources :contacts
  get 'contact' => 'contacts#new'

  devise_for :users
  
  resources :newsletters
  get 'newsletter' => 'newsletters#new'
  root 'pages#index'
  get 'post' => 'posts#new'
  resources :posts
end
