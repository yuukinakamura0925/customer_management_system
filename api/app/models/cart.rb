class Cart < ApplicationRecord
     has_many :cart_details
     belongs_to :customer
end
