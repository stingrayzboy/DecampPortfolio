Rails.application.routes.draw do
  resources :portfolios ,except: [:show]

  get 'portfolio/:id', to:"portfolios#show", as: "show_portfolio"

  root 'pages#home'

  get 'pages/about'

  get 'pages/contact'

  get 'toggle/:id', to:'blogs#bazzinga', as:'toggle'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
