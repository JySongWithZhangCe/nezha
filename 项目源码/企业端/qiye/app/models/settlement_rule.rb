class SettlementRule < ApplicationRecord
  belongs_to :category
  belongs_to :city

  has_many :settlement_prices, dependent: :destroy
end
