Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  resources :goals do
    resources :tasks
    resources :likes
    resources :bookmarks, only: [ :create, :destroy ]
  end
  patch 'tasks/:id/completed', to: 'tasks#completed', as: 'completed'
  patch 'tasks/:id/incomplete', to: 'tasks#incomplete', as: 'incomplete'
end
  # Defines the root path route ("/")
  # root "articles#index"
