Rails.application.routes.draw do
  root  'static_pages#home'
  match '/signup',  to: 'users#new', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
end
