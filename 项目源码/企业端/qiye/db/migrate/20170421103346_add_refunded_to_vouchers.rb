class AddRefundedToVouchers < ActiveRecord::Migration[5.0]
  def change
    add_column :vouchers, :refunded, :boolean, default: false
  end
end
