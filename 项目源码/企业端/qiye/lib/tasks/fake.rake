task :fake_datas => :environment do
  # cleanup data
  user = User.find_by_mobile('0' * 13)
  user.destroy if user

  factory = Factory.find_by_mobile('1' * 13)
  factory.destroy if factory

  courier = Courier.find_by_mobile('2' * 13)
  courier.destroy if courier

  city = City.find_by_name('fake_city')
  if city
    city.categories.clear

    city.destroy
  end

  category = Category.find_by_name('fake_category')
  if category
    category.destroy
  end

  worker = Worker.find_by_email('fenchengshi@washing.com')


  # create fake data
  user = User.create(encrypted_password: 'fake_password', mobile: '0' * 13)
  factory = Factory.create(encrypted_password: 'fake_password', mobile: '1' * 13)
  courier = Courier.create(encrypted_password: 'fake_password', mobile: '2' * 13)

  city = City.create(name: 'fake_city')

  worker.cities << city

  category = Category.create(name: 'fake_category')

  city.categories << category

  1.upto(10).each do |idx|
    product = category.products.create(name: "fake_product_#{idx}")
    product.create_price(price1: idx, price2: idx, price3: idx, price4: idx, price5: idx, price6: idx)
  end

  from_date = Date.new(2017, 1, 1)
  to_date = Date.new(2017, 6, 30)

  serial_counter = 0

  from_date.upto(to_date).each do |date|
    products = category.products.sample(4)
    products.each do |product|
      total_price = product.price.price1 * 2
      order = Order.create(category: category, user: user, factory: factory, voucher_status: 2, cleaning_status: 2, courier_status: 2, total_price: total_price, created_at: date, updated_at: date)
      order.items.create(amount: 2, price: product.price.price1, product: product)
      2.times do 
        order.product_items.create(serial: "serial_#{serial_counter}", status: 2, order: order, product: product, created_at: date, updated_at: date)
        serial_counter += 1
      end
      voucher = order.create_voucher(status: 2, payed_at: date, money: total_price, user_card_pay: total_price)
    end
  end

  settlement_rule = SettlementRule.create(name: '普通结算', city: city, category: category)
  category.products.each do |product|
    settlement_rule.settlement_prices.create(product: product, price: product.price.price1 * 0.5)
  end
  FactorySettlementRule.create(from_date: '2017-01-01', factory: factory, settlement_rule: settlement_rule)

  settlement_rule = SettlementRule.create(name: '普通结算', city: city, category: category)

  category.products.each do |product|
    settlement_rule.settlement_prices.create(product: product, price: product.price.price1 * 0.3)
  end
  FactorySettlementRule.create(from_date: '2017-04-01', factory: factory, settlement_rule: settlement_rule)

end