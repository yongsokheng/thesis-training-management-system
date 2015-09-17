Rails.application.routes.draw do
  filter :locale
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root "static_pages#home"
  devise_for :users, path: "auth", path_names: {sign_in: "login", sign_out: "logout"}
  resources :courses do
    resources :user_subjects, only: :show
  end
  resources :users, only: [:edit, :update, :show]
end
