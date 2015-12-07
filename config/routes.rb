Rails.application.routes.draw do
  root 'pages#index'
  
  get 'contact' => 'contacts#new'
  get 'about' => 'pages#about'
  get 'tags/:tag', to: 'posts#index', as: :tag
  
  devise_for :users
  
  resources :newsletters, only: [:new, :create]
  resources :contacts, only: [:new, :create]
  resources :posts
end
