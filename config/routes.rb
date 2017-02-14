Rails.application.routes.draw do
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
  get 'signup',to:'page_home#new'

  resources :microposts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
