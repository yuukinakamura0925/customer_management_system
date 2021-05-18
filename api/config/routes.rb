Rails.application.routes.draw do
  resources :customers, :categories, :menus, :order_details, :orders
end
