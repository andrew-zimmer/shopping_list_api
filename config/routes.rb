Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: {format: :json} do
    resource :sessions, only: [:create, :destroy]
    resource :users, only: [:create]
    resources :groups
    resources :lists
    resources :list_items
  end
end
