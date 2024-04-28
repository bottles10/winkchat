Rails.application.routes.draw do
  get 'profile/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check



  resources :posts do
    resources :comments
  end

  get ":username", to: "profile#show", as: :profile
  get ":username/edit", to: "profile#edit", as: :edit_profile
  patch ":username/edit", to: "profile#update", as: :update_profile
  # Defines the root path route ("/")
   root "posts#index"
end
