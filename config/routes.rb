Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "main#index"
  post "login", to: "sessions#check"
  get "registration", to: "sessions#index"
  post "registration", to: "sessions#create", as: :register

  get "dashboard", to: "dashboards#index"
  get "search_posts", to: "dashboards#index"
  post "new_post", to: "dashboards#create"
  delete "delete_posts/:id", to: "dashboards#destroy", as: :delete_post
  get "posts/:id/edit", to: "dashboards#edit", as: :edit_post
  patch "update_post/:id", to: "dashboards#update", as: :update_post
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "up" => "rails/health#show", as: :rails_health_check
end
