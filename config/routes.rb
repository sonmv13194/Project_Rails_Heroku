Rails.application.routes.draw do
  get 'page_home/home'

  get 'page_home/help'

  get 'page_home/about'

  get 'page_home/contact'



  resources :microposts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
