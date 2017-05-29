class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.float :month_pay
      t.float :month_recharge
      t.float :balance
      t.integer :point
      t.integer :user_id
      t.integer :discount

      t.timestamps
    end
  end
end
