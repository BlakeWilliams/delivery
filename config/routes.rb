Delivery::Application.routes.draw do
  resources :groups do
    resources :emails, only: [:create, :destroy]
  end

  #get  'signup', to: "users#new", as: 'signup'
  #post 'signup', to: "users#create"

  get  'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  get  'logout', to: 'sessions#destroy'

  root to: "sessions#new"
end
