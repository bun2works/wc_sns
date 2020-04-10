Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
  devise_for :teams, controllers: {
    sessions:      'teams/sessions',
    passwords:     'teams/passwords',
    registrations: 'teams/registrations'
  }

  resources :posts, only: [:create, :index, :new, :show]
  resources :comments, only: :create
  resources :teams, only: [:index, :show]

  get 'comments' => redirect('posts')
  root 'teams#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
