Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :bookmarks
  resources :goals do
    resources :tasks
  end
end
  # Defines the root path route ("/")
  # root "articles#index"
