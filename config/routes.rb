Rails.application.routes.draw do
  root "weather#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :weather, only: [:show]
    end
  end
end
