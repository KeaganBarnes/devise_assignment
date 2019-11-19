Rails.application.routes.draw do
  root "bands#index"
  devise_for :users

  resources :bands
end
