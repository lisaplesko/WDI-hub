Rails.application.routes.draw do
  root to: 'students#index'

  get 'students/:id/total_code', :to => 'students#total_code'
  get 'students/:id/total_language', :to => 'students#total_language'

  resources :students, except: [:new, :edit]
end
