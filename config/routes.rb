Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :events, only: %i[new create show update] do
    resources :event_bars, only: %i[show update]
  end

  resources :users, only: %i[show]
  resources :bars, only: %i[index show]

  get "/myevents", to: "events#myevents", as: "myevents"

end
