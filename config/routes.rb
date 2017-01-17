Rails.application.routes.draw do
  devise_for :users
  resources :jobs
  root 'welcome#index'
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

  resources :welcome do

  end

end
