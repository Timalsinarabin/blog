Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "main#index"
  post "login", to: "sessions#check"

  get "dashboard", to: "dashboards#index"
  post "new_post", to: "dashboards#create"
  delete "delete_posts/:id", to: "dashboards#destroy", as: :delete_posts
  get "up" => "rails/health#show", as: :rails_health_check
end
