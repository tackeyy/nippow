Rails.application.routes.draw do
  root 'dashboad#index'

  get 'oauth/callback' => 'oauths#callback'
  get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
  post 'oauth/callback' => 'oauths#callback'
  delete 'oauth/:provider' => 'oauths#destroy', as: :delete_oauth

  resource :sign_up, controller: 'sign_up', only: %w(show create)
  resource :sign_in, controller: 'sign_in', only: %w(show create)

  resources :repositories, only: %w(index create destroy)
  resources :organizations, only: %w(index create destroy)
end
