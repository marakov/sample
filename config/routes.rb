Rails.application.routes.draw do
  root  'static_pages#home'

  resources :users
  resources :channels
  resources :subscribes
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/help', to: 'static_pages#help', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/news', to: 'static_pages#news', via: 'get'
 end
