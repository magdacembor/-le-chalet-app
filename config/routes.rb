Rails.application.routes.draw do
  devise_for :users
  root to: 'chalets#home'
  resources :chalets do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
