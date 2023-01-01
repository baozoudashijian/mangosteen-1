Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :validations, only: [:create]
      resources :session, only: [:create, :destroy]
      resources :me, only: [:show]
      resources :items
      resources :tags
    end
  end
end
