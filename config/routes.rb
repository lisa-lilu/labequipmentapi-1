Rails.application.routes.draw do
  resources :equipment
  resources :categories
  resources :maintenance_records
  resources :equipment
end
