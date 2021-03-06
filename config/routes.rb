Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "api/v1/auth"

  namespace :api, format: :json do
    namespace :v1 do
      resources :articles
    end
  end
end
