Rails.application.routes.draw do

  mount Aact::Engine => "/aact"
  resources :charts
  resources :studies
  root 'studies#index'

end
