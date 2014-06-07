Wiki::Application.routes.draw do

  devise_for :users

  resources :pages

  put 'pages/:id/set_collaborators', to: 'pages#set_collaborators'

  root 'welcome#index'

end

