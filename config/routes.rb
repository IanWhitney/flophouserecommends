Rails.application.routes.draw do
  root to: "episodes#latest"

  resources :episodes, only: [:index, :show]
  resources :hosts, only: [:index, :show]
  resources :movies, only: [:show]
end
