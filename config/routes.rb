Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users,path: "",path_names:{:sign_in=>"login",sign_out:"logout",sign_up:"register"}


  resources :portfolios ,except: [:show] do
    put :sort , on: :collection
  end

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
  get "topic/:topic_id",to:"blogs#index",as:"blog_topic"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
