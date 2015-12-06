Rails.application.routes.draw do
  get 'contact' => 'contacts#new'
  get 'about' => 'pages#about'
  resources :contacts
  
  devise_for :users
  
  resources :newsletters
  get 'newsletter' => 'newsletters#new'
  root 'pages#index'
  get 'post' => 'posts#new'
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: :tag
end
