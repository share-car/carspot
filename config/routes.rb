require 'api_constraints'
Rails.application.routes.draw do
  namespace :api, format: 'json' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get 'profiles/me', to: 'profiles#me'
      put 'profiles/me', to: 'profiles#update'
      resources :profiles, only: [:show]
      resources :attachments
      resources :users
      resources :cars
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: redirect('index.html')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
