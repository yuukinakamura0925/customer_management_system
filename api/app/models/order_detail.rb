class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  has_one :menu, optional: true
end
