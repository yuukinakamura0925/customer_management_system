class CartDetail < ApplicationRecord
  belongs_to :cart
  has_one :menu
end
