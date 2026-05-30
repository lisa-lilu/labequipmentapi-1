Rails.application.routes.draw do
  resources :categories
  resources :maintenance_records
  resources :equipment
end
