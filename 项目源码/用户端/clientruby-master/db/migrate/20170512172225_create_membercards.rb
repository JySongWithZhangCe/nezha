class CreateMembercards < ActiveRecord::Migration[5.0]



def change
    create_table :membercards do |t|
      t.integer :min
      t.integer :give
      t.integer :max
      t.datetime :pay_time
      t.text :detail
      t.string :kind
      t.integer :user_id

      t.timestamps
    end
  end




end
