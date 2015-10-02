Rails.application.routes.draw do
  filter :locale
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root "courses#show"
  devise_for :users, path: "auth", path_names: {sign_in: "login", sign_out: "logout"}

  resources :courses, only: :show do
    resources :subjects, only: [:show, :update] do
      patch "/:status" => "subjects#update", as: :finish_subject
    end
    resources :user_subjects, only: :update
  end
  resources :users, only: [:edit, :update, :show]
  resources :subjects, only: [:show]
  resources :tasks, only: [:show]
end
