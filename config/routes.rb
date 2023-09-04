Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :events, only: %i[new create show update] do
    member do
      patch '/update_participant', to: 'events#update_participant'
    end

    resources :event_bars, only: %i[index]
  end

  resources :users, only: %i[show]
  resources :bars, only: %i[index show]
  resources :event_bars, only: %i[show update] do
    resources :votes, only: %i[create]
  end
  resources :votes, only: %i[destroy]
  get "/myevents", to: "events#myevents", as: "myevents"
  get "/recap", to: "pages#recap", as: "recap"
end
