Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/projects/search', to: 'projects#search', as: :search
  get '/projects/home', to: 'projects#home', as: :home
  get '/projects/home/scan', to: 'projects#scan', as: :scan
  get '/projects', to: 'projects#index'
  get '/projects/new', to: 'projects#new'
  get 'tags/:tag', to: 'boxes#index', as: :tag

  resources :items, only: [:edit, :update, :destroy] do
    resources :item_tags, only: [:new, :create]
  end
  resources :boxes, only: [:edit, :update, :destroy] do
    resources :box_tags, only: [:new, :create]
  end
  resources :tags, only: [:edit, :destroy, :new, :create]

  resources :projects, only: [:show] do

    resources :items, only: [:new, :create, :index]
    resources :boxes, only: [:new, :create, :index, :show]
    get '/boxes/:id/qr_show', to: 'boxes#qr_show', as: :qr_show

 end
end
