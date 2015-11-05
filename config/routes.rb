Aact::Engine.routes.draw do
  resources :charts
  resources :studies
  resources :ctms_studies
  root 'studies#index'
end
