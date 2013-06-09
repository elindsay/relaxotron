Relaxotron::Application.routes.draw do
  root to: "zones#index"

  resources :zones
end
