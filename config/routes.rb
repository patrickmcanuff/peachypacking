Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/project/:id/search', to: 'project#search', as: :search
  get '/project/:id/home', to: 'project#home', as: :home
  get '/project/:id/home/scan', to: 'project#scan', as: :scan

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
