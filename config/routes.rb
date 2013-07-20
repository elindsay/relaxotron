Relaxotron::Application.routes.draw do
  root to: "zones#index"
  get 'video(/:video_slug)(/audio/:audio_slug)' => "zones#show", as: "video_audio"

  resources :zones
  resources :videos
  resources :sound_clips
end
