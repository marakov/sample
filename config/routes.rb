Rails.application.routes.draw do
  root  'static_pages#home'

  resources :users
  resources :channels, only: [:index, :show]
  resources :feeds
  resources :subscribes
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/channels', to: 'channels#search',     via: 'post'

  # match '/subscribe', to: 'subscribes#destroy', via: 'delete'
  # match '/post', to: 'posts#delete', via: 'delete'

  match '/help', to: 'static_pages#help', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
 end
