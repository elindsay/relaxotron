Relaxotron::Application.routes.draw do
  root to: "home#index"
  get 'video(/:video_slug)(/audio/:audio_slug)' => "zones#show", as: "video_audio"

  resource :home, only: [:index]
  resources :zones
  resources :articles

  namespace :admin do
    root to: "home#index"
    resources :home, only: [:index]
    resources :articles
    resources :article_pictures
    resources :zones
    resources :videos
    resources :sound_clips
  end
end
