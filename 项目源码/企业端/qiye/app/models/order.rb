class Order < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :address

  has_many :waybills, dependent: :destroy

  belongs_to :waybill

  has_many :items, dependent: :destroy
  has_many :product_items, dependent: :destroy

  has_one :voucher, dependent: :destroy
  belongs_to :factory

  def paidan
    u_t_c = self.waybills.create(sender: self.user, receiver: Courier.first, exp_time: Time.now + 2.hours, status: 1)
    c_t_f = self.waybills.create(sender: Courier.first, receiver: Factory.first)

    self.waybill = u_t_c
    u_t_c.waybill = c_t_f

    self.save
    u_t_c.save
  end

  def gen_product_items
    self.items.each do |item|
      item.amount.times do 
        self.product_items.create(product: item.product)
      end
    end
  end
end
