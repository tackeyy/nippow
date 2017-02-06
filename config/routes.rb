Rails.application.routes.draw do
  root 'users#show'

  get 'oauth/callback' => 'oauths#callback'
  get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
  post 'oauth/callback' => 'oauths#callback'
  delete 'oauth/:provider' => 'oauths#destroy', as: :delete_oauth

  resource :user do
    resource :sign_up, controller: 'users/sign_up', only: [:show, :create]
    resource :sign_in, controller: 'users/sign_in', only: [:show, :create]
    resources :repositories
  end

end
