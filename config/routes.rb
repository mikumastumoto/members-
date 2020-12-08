Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users
  resources :intros
  root 'comments#index' # ここを追記します
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
