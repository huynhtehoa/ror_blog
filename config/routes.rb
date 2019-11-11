Rails.application.routes.draw do
  devise_for :users
  get 'comments/create'

  get 'comments/destroy'

  get 'posts/index'
  root 'posts#index'
  resources :posts do
    resources :comments
  end
end
