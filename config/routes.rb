Rails.application.routes.draw do
  get 'sessions/create'
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'teacher_courses', to: 'courses#teacher_index'
      resources :courses, only: %i[index show update create destroy] do
        resources :subscriptions, only: %i[create destroy]
        resources :lectures, only: %i[index show update create destroy]
      end
      resources :subscriptions, only: %i[index]
      resources :sessions, only: %i[create]
    end
  end
  # root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
