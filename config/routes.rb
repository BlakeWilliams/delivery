Delivery::Application.routes.draw do
  get  'signup', to: "users#new", as: 'signup'
  post 'signup', to: "users#create"

  get  'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  root to: "users#new"
end
