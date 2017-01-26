Rails.application.routes.draw do
  devise_for :users
  resources :deeds
  resources :hustles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated do
    root to: "hustles#index"
  end

  devise_scope :user do
    

    unauthenticated do
      root to: "devise/sessions#new"
    end
    get 'sign_in', to: 'devise/sessions#new'
  end
end
