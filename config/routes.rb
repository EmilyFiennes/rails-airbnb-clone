Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    resources :users, only: [:show]
    resources :items, only: [:index, :show, :new, :create] do
      resources :reservations do
        member do
          post 'cancel'
          post 'accept'
          post 'decline'
        end
      end
    end
  root to: 'pages#home'
end
