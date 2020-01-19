Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    member do
      put :inline_update
    end

    collection do
      get :bootstrap
    end
  end
end
