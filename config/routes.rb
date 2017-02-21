Rails.application.routes.draw do
  resources :rolls
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated do
    root to: "hustles#index"

    glob_actions = [:index, :new, :create, :show, :update, :destroy]

    resources :hustles, only: glob_actions do
      resources :deeds, only: [:new, :create]

      # post 'rename'
    end

    resources :rolls, only: glob_actions do
      post 'finish'
    end

    resources :deeds, only: [:destroy, :update] do
      post 'start'
      post 'pause'
      post 'do'

      resources :rolls, only: [] do
        post 'add'
      end
    end
  end

  devise_scope :user do
    unauthenticated do
      root to: 'devise/sessions#new'
    end
    get 'sign_in', to: 'devise/sessions#new'
  end
end
