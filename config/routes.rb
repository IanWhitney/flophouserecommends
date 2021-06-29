Rails.application.routes.draw do
  root to: "episodes#index"

  resources :episodes, only: [:index, :show]
  resources :hosts, only: [:index, :show]
end
