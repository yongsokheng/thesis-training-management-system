Rails.application.routes.draw do
  devise_for :users, path: "auth", path_names: {sign_in: "login", sign_out: "logout"}
  
  namespace :admin do
    root "users#index"
    resource :users
  end
end
