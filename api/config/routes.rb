Rails.application.routes.draw do
  resources :customers, :categories, :menus, :order_details, :orders

  resources :carts do
    resources :cart_details
  end
  
end
