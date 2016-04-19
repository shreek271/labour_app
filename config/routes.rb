Rails.application.routes.draw do

  resources :customers
  
  root          'main_pages#home'
  get 'about'   =>'main_pages#about'
  get 'help'    =>'main_pages#help'
  get 'contact' =>'main_pages#contact'

  get 'signup'  =>'customers#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  

end
