Rails.application.routes.draw do

  get 'students/:id/total_code', :to => 'students#total_code'
  get 'students/:id/total_language', :to => 'students#total_language'

  resources :students, only: [:index, :show]
end
