Rails.application.routes.draw do
  resources :task_images
  resources :task
  resources :users
  resources :main

  get 'main/index'
  get 'main/new'

  get 'task/index'
  get 'task/new'

  get 'users/show'

  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'task#index'
end
