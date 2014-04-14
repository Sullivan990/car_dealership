CarDealership::Application.routes.draw do
  resources :cars, only: [:new, :create]
  resources :manufacturers, only: [:new, :create]

end
