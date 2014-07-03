Rails.application.routes.draw do
  root to: 'students#index'
  resources :students, except: [:new, :edit]
end
