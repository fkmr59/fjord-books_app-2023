Rails.application.routes.draw do
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :users, only: %i(index show)
  resources :books do
    resources :comments, only: %i[create destroy edit update], module: :books
    # resources :comments, controller: :books_conmments ,only: :create
  end
  # resources :reports
  resources :reports do
    resources :comments, only: %i[create destroy edit update], module: :reports
  end
  
end
