Rails.application.routes.draw do
  # root to: static('index.html')
  root to: redirect('index.html')

  #brands
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
