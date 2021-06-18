class Menu < ApplicationRecord
  belongs_to :order_detail
  belongs_to :cart_detail
  belongs_to :category
end
