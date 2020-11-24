Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects do
    resources :tags
    resources :items do
       resources :tags
    end
    resources :boxes do
       resources :tags
    end
 end
end
