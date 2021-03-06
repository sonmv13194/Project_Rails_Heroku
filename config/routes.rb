Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'session/new'

  get 'user/new'

  get 'page_home/home'

  get 'page_home/help'

  get 'page_home/about'

  get 'page_home/contact'

  get 'page_home/signup'

  root 'page_home#home'
  get 'home',to:'page_home#home'
  get 'help',to:'page_home#help'
  get 'contact',to:'page_home#contact'
  get 'about',to:'page_home#about'
  get 'signup',to:'users#new'
  get 'login',to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout',to:'sessions#destroy'
  get 'User', to:'page_home#users'
  get 'Post', to:'page_home#microposts'

  resources :users do
    member do
      get   :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
 
  resources :microposts do
    resources :comments
    end      
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
