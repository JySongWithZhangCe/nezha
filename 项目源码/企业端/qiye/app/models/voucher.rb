class Voucher < ApplicationRecord
  belongs_to :order
  belongs_to :coupon, optional: true

  def refund
    self.update_attribute(:refunded, true)

    user = self.order.user
    user.user_card.refund(self)
    self.coupon.refund
  end
end
