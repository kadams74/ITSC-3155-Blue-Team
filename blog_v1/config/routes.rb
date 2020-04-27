Rails.application.routes.draw do
  resources :stories
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
  
  resources :movies do
    resources :reviews
    resources :ratings
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'search', to: 'search#search', as: 'search_page'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
