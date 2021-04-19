Rails.application.routes.draw do
  resources :customers, :category, :menu, :order_detail, :order
end
