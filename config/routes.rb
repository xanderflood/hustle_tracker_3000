Rails.application.routes.draw do
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated do
    root to: "hustles#index"

    resources :hustles, only: [:index, :new, :create, :show, :destroy] do
      resources :deeds, only: [:new, :create, :show, :destroy] do
        #post "new", to: :create, as: :new
      end
    end
  end

  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new"
    end
    get 'sign_in', to: 'devise/sessions#new'
  end
end
