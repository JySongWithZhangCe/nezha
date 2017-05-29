class UserCard < ApplicationRecord
  belongs_to :user
  has_many :user_card_logs

  def charge(real_money, fake_money)
    self.update_attributes(real_money: self.real_money + real_money, fake_money: self.fake_money + fake_money)
  end

  def refund(voucher)
    user_card_log = UserCardLog.create(kind: 4, loggable: voucher, user_card: voucher.order.user.user_card, real_money: voucher.user_card_pay, fake_money: voucher.user_card_fake_money_pay)
    self.update_attributes(real_money: self.real_money + voucher.user_card_pay, fake_money: self.fake_money + voucher.user_card_fake_money_pay)
  end
end
