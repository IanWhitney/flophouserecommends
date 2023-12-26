Rails.application.routes.draw do
  root to: "episodes#latest"

  resources :episodes, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :hosts, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :movies, only: [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :about, only: [:index] do
  end
  get "up" => "rails/health#show", :as => :rails_health_check
end
