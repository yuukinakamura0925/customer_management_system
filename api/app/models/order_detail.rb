class OrderDetail < ApplicationRecord
  belongs_to :order
  has_one :menu
end
