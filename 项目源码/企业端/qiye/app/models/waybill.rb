class Waybill < ApplicationRecord
  belongs_to :order

  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  belongs_to :waybill
end
