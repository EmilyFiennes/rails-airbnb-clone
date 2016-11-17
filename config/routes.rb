Rails.application.routes.draw do
  # get 'users/show'

  # get 'reservations/index'

  # get 'reservations/show'

  # get 'reservations/new'

  # get 'reservations/create'

  # get 'reservations/destroy'

  # get 'items/index'

  # get 'items/show'

  # get 'items/new'

  # get 'items/create'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    resources :users, only: [:show]
    resources :items, only: [:index, :show, :new, :create] do
      resources :reservations do
        member do
          get 'cancel'
          get 'accept'
          get 'decline'
        end
      end
    end
  root to: 'pages#home'
end
