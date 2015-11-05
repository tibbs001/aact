Rails.application.routes.draw do

  mount Aact::Engine => "/aact"
  resources :studies
  root 'studies#index'

end
