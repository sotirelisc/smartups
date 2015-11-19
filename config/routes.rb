Rails.application.routes.draw do
  
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  devise_for :users
  
  resources :newsletters
  get 'newsletter' => 'newsletters#new'

  root 'pages#index'
  resources :posts

end
