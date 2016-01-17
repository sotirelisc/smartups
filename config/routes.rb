Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/profile'
  get 'dashboard/search'
  get 'dashboard/settings'
  get 'dashboard/support'
  get 'dashboard' => 'dashboard#index'
  
  get 'newsletters' => 'newsletters#new'

  root 'pages#index'
  
  get 'contact' => 'contacts#new'
  get 'about' => 'pages#about'
  get 'tags/:tag', to: 'posts#index', as: :tag
  
  devise_for :users
  
  resources :newsletters, only: [:new, :create]
  resources :contacts, only: [:new, :create]
  resources :posts
end
