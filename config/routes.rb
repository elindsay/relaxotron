Relaxotron::Application.routes.draw do
  root to: "zones#index"

  resources :zones
  resources :videos
  resources :sound_clips
end
