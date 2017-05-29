class Product < ApplicationRecord
  belongs_to :category

  has_one :price, dependent: :destroy
end
