Rails.application.routes.draw do
  root to: 'pages#home'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    resources :users, only: [:show]
    resources :items, only: [:index, :show, :new, :create, :destroy] do
      resources :reservations do
        member do
          post 'cancel'
          post 'accept'
          post 'decline'
        end
      end
    end

end
