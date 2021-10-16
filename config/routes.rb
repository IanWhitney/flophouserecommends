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

  match "*path", via: :all, to: redirect("/404")
end
