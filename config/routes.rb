Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end

    resources :badges

    resources :gists, only: %i[index]

  end

  resources :feedback, only: %i[new create]

  resources :badges, only: %i[index]

end
