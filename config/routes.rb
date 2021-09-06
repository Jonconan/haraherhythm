Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :lives, only: [] do
    get '/', action: :index
  end

  resources :artists, only: [] do
    get '/', action: :index
    resources :items, only: [:index]
  end

  resources :items, only: [:show] do
  end
end
