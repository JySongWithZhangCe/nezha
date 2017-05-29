class SubmitItemsJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    money = 0
    order.items.each do |item|
      money += item.amount * item.price
    end
    order.create_voucher(money: money)
    order.update_attributes(voucher_status: 1)
  end
end
