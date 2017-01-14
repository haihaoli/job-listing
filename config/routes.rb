Rails.application.routes.draw do
  devise_for :users
  resources :jobs
  root 'jobs#index'
  namespace :admin do
    resources :jobs do
      member do
        post :hide
        post :publish
      end
    resources :resumes
    end
  end
end
