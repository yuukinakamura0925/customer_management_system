class Menu < ApplicationRecord
  belongs_to :order_detail, optional: true
  belongs_to :cart_detail, optional: true
  has_one :category
end
