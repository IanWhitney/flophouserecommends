Rails.application.routes.draw do
  resources :episodes, only: [:index]
  root to: "episodes#index"
end
