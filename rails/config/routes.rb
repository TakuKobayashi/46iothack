Rails.application.routes.draw do

  get "/auth/:provider/callback" => "authenticate#oauth_callback"

  root to: "top#index"

  resource :authenticate, controller: :authenticate_controller, only: [] do
    post 'login'
    post 'logout'
  end

  resource :order, controller: :order_controller, only: [] do
    post 'execute'
    get 'result'
  end

  resource :recommend, controller: :recommend_controller, only: [] do
    post 'imagine'
    post 'random'
    get 'choice'
    get 'confirm'
  end

  resources :accounts, only: [:new, :create] do
    collection do
      get 'login'
    end
  end

  resources :histories, only: [:index]
end
