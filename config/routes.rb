Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tops#index"

  resources :users, only: %i[new create]
  resource :user_session, only: %i[new create destroy]

  namespace :manager do
    resources :toilets
  end

  namespace :tablet do
    get '/:uuid', to: 'dashboards#index', as: 'dashboard'
  end

  namespace :waiting do
    get '/:uuid', to: 'dashboards#index', as: 'dashboard'
  end

end
