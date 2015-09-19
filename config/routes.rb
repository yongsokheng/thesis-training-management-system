Rails.application.routes.draw do
  filter :locale
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  root "user_courses#index"
  devise_for :users, path: "auth", path_names: {sign_in: "login", sign_out: "logout"}

  resources :user_courses, only: :index do
    resources :user_subjects, only: [:show, :update] do
      patch "/:status" => "subjects#update", as: :finish_subject
    end
  end
  resources :users, only: [:edit, :update, :show]
  resources :subjects, only: [:show]
  resources :courses, only: [:show]
  resources :tasks, onley: [:show]
end
