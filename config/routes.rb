Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :tasks, only: [:new,:index,:create,:edit,:update,:destroy]
  resources :users, only: [:index,:edit,:update,:destroy]
  resources :groups, only: [:new, :create, :edit, :update,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
