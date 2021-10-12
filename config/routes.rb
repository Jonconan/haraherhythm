Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  devise_for :artists, :controllers => {
    :registrations => 'artists/registrations',
    :sessions => 'artists/sessions'
  }
  devise_scope :artist do
    get '/artists/sign_out' => 'artists/sessions#destroy', as: :artist_sign_out
  end

  resources :lives, only: [] do
    get '/', action: :index
  end

  resources :artists, only: [] do
    get '/', action: :index
    resources :items, only: [:index]
  end

  resources :items, only: [:show] do
  end

  namespace :mypage do
    get '/', action: :index
    get :edit
    post :update
    resources :lives, only: [:index, :new, :create, :show] do
      get :join_live
      get :left_live
    end
  end
end
