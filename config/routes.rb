Rails.application.routes.draw do
  get 'page_home/home'

  get 'page_home/help'

  get 'page_home/about'

  get 'page_home/contact'

  root 'page_home#home'
  get 'home',to:'page_home#home'
  get 'help',to:'page_home#help'
<<<<<<< HEAD
  get 'contact',to:'page_home#contact'
=======
  get 'about',to:'page_home#about'
>>>>>>> filling-in-layout

  resources :microposts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
