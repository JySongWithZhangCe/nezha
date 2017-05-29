json.extract! voucher, :id, :order_id, :status, :payed_at, :money, :user_card_pay, :created_at, :updated_at
json.url voucher_url(voucher, format: :json)