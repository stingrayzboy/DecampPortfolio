Rails.application.routes.draw do
  devise_for :users
  resources :portfolios ,except: [:show]

  get 'portfolio/:id', to:"portfolios#show", as: "show_portfolio"

  root 'pages#home'

  get 'pages/about'

  get 'pages/contact'

  #get 'toggle/:id', to:'blogs#bazzinga', as:'toggle'

  resources :blogs do
  	member do
  		post :toggle_status
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
