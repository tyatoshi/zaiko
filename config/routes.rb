Rails.application.routes.draw do

  root to: "toppages#index"
  
  get "signup" , to: "users#new" 
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  resources :users, only: [:index, :show, :new, :create]
  
  resources :zaikos, only: [:index, :create, :update, :destroy] do
    member do
      get :graph
      get :order
      get :add
    end
  end
end
