Wiki::Application.routes.draw do


  resources :pages

  devise_for :users
  root 'welcome#index'

end

