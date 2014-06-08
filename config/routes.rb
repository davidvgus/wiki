Wiki::Application.routes.draw do

  devise_for :users

  resources :pages

  put 'pages/:id/set_collaborators', to: 'pages#set_collaborators'

  resources :charges, only: [:new, :create]

  root 'welcome#index'

end

