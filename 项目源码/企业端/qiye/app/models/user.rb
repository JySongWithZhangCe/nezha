class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :user_card
  
  has_many :deliver_waybills, as: :sender, class_name: Waybill
  has_many :pickup_waybills, as: :receiver, class_name: Waybill

  has_many :coupons
end
