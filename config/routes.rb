Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, only: [:show, :new, :create, :edit, :update, :destroy]
  end
end
