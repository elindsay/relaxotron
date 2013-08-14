Relaxotron::Application.routes.draw do
  root to: "home#index"
  get "main_2" => "zones#index_two"
  get "main_3" => "zones#index_three"
  get 'video(/:video_slug)(/audio/:audio_slug)' => "zones#show", as: "video_audio"
  get 'video_2(/:video_slug)(/audio/:audio_slug)' => "zones#show_two", as: "video_audio_two"

  resource :home, only: [:index]
  resources :zones

  namespace :admin do
    root to: "home#index"
    resources :home, only: [:index]
    resources :zones
    resources :videos
    resources :sound_clips
  end
end
