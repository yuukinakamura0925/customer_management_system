Rails.application.routes.draw do
  resources :customers, :category, :menus, :order_detail, :order
end
