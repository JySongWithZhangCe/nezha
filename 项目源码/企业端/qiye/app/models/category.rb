class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  has_many :prices, through: :products
end
