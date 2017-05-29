class City < ApplicationRecord
  belongs_to :region

  has_many :price_rules

  has_many :settlement_rules, dependent: :destroy

  has_and_belongs_to_many :categories

  has_many :cities_workers, dependent: :destroy
end
