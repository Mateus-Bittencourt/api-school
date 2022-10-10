Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :courses, only: %i[index show update create destroy] do
        resources :subscriptions, only: %i[create destroy]
      end
      resources :subscriptions, only: %i[index]
    end
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
