Relaxotron::Application.routes.draw do
  root to: "home#index"
  get 'video(/:video_slug)(/audio/:audio_slug)' => "zones#show", as: "video_audio"
  get 'checkout' => 'checkout#show_cart', as: "checkout"
  post 'checkout' => 'checkout#pay'
  get 'checkout_complete' => 'checkout#finished', as: "checkout_finished"
  get 'checkout_problem' => 'checkout#problem'
  get 'marketplace' => 'products#index', as: 'marketplace'
  post 'add_to_cart' => 'shopping_carts#add_to_cart', as: "add_to_cart"
  delete 'remove_from_cart' => 'shopping_carts#remove_from_cart', as: "remove_from_cart"

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
