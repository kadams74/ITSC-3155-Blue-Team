Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  get 'login/index'
  get 'coming_soon/index'
  get 'movies/index'
  get 'welcome/index'
  
  resources :articles do
    resources :comments
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
