class RemoveCityIdFromUserCardChargeSettings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :user_card_charge_settings, :city, index: true, foreign_key: true
  end
end
