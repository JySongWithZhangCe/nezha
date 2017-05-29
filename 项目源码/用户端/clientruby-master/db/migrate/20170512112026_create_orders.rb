class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :category
      t.text :address
      t.integer :user_id

      t.timestamps
    end
  end
end
