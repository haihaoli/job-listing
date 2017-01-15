Rails.application.routes.draw do
  devise_for :users
  resources :jobs
  root 'jobs#index'
  namespace :admin do
    resources :jobs do
      resources :resumes
      member do
        post :hide
        post :publish
      end
    end
  end

  resources :jobs do
    resources :resumes
  end

end
