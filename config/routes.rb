Rails.application.routes.draw do
  
  root          'main_pages#home'
  get 'about'   =>'main_pages#about'
  get 'help'    =>'main_pages#help'
  get 'contact' =>'main_pages#contact'

  get 'signup'  =>'customers#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :customers do
  	member do
  		get :following, :followers
  	end
  end
  resources :account_activations, only: [:edit]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
