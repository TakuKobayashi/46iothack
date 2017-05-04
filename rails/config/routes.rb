Rails.application.routes.draw do

  get "/auth/:provider/callback" => "authenticate#oauth_callback"

  root to: "top#index"

  resource :authenticate, controller: :authenticate, only: [] do
    post 'login'
    post 'logout'
  end

  resource :order, controller: :order, only: [] do
    post 'execute'
    get 'result'
  end

  resource :recommend, controller: :recommend, only: [] do
    post 'imagine'
    post 'random'
    get 'imageine_json'
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
