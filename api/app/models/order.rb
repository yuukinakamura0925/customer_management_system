class Order < ApplicationRecord
  belongs_to :orders_menu
  belongs_to :customer
end
