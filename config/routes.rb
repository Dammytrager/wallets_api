Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resource :sessions, only: [:create]
    resource :users, only: [:create, :update]
    resource :wallet, only: [:show] do
      post :credit
      post :send_pin, path: '/credit/send_pin'
      post :send_otp, path: '/credit/send_otp'
    end
    resource :debit_cards, only: [:create, :destroy] do
      post :send_pin
      post :send_otp
    end
    resources :banks, only: [:index]
    resource :bank_account, only: [] do
      post :verify
    end
  end
end
