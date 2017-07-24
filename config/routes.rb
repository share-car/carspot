Rails.application.routes.draw do
  get 'attachment/show'

  get 'profiles/show'

  get 'users/show'

  resources :profiles
  resources :attachments
  resources :users
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: redirect('index.html')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
