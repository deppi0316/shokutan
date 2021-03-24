Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'shops', to: 'users/registrations#new_shop'
    post 'shops', to: 'users/registrations#create_shop'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts do
    collection do
      get 'search'
    end
    resources :likes, only: %i[create destroy]
  end
  resources :users, only: :show
  resources :menus, only: %i[new create edit update destroy show]
  resources :shops, only: %i[edit update show]
end
