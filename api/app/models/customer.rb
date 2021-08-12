class Customer < ApplicationRecord
  # validates :string, presence: true かならず情報をいれる場合のバリデーション
  has_one :cart
  has_many :orders, dependent: :destroy
end
