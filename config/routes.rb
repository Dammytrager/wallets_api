Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resource :sessions, only: [:create]
    resource :users, only: [:create, :update]
    resource :wallet, only: [:show]
  end
end
