Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: {format: :json} do
    resource :sessions, only: [:create, :destroy]
    resource :users, only: [:create]
    resource :groups, only: [:create, :destroy, :update, :show, :index]
    resource :lists, only: [:create, :update, :show, :index, :destroy]
    resource :list_items, only: [:create, :update, :show, :index, :destroy]
  end
end
