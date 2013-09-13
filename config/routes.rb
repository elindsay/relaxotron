Relaxotron::Application.routes.draw do
  root to: "home#index"
  get 'video(/:video_slug)(/audio/:audio_slug)' => "zones#show", as: "video_audio"
  get 'checkout' => 'checkout#show'
  post 'checkout' => 'checkout#pay'
  get 'checkout_complete' => 'checkout#finished'
  get 'checkout_problem' => 'checkout#problem'
  get 'marketplace' => 'products#index', as: 'marketplace'

  resource :home, only: [:index]
  resources :zones
  resources :articles
  resources :products

  namespace :admin do
    root to: "home#index"
    resources :home, only: [:index]
    resources :articles
    resources :article_pictures
    resources :zones
    resources :videos
    resources :sound_clips
    resources :products
  end
end
