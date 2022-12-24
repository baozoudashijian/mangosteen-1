Rails.application.routes.draw do
  get 'validations/create'
  namespace :api do
    namespace :v1 do
      get 'items/index'
      resources :validations, only: [:create]
      resources :session, only: [:create, :destroy]
      resources :me, only: [:show]
      resources :items
      resources :tags
    end
  end
end
