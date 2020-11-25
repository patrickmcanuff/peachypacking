Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/projects/:id/search', to: 'projects#search', as: :search
  get '/projects/:id/home', to: 'projects#home', as: :home
  get '/projects/:id/home/scan', to: 'projects#scan', as: :scan

  resources :items, only: [:edit, :destroy] do
    resources :item_tags, only: [:new, :create]
  end
  resources :boxes, only: [:edit, :destroy] do
    resources :box_tags, only: [:new, :create]
  end
  resources :tags, only: [:edit, :destroy,:new, :create]

  resources :projects, only: [] do
    resources :items, only: [:new, :create]
    resources :boxes, only: [:new, :create, :index]
 end
end
