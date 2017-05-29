class GoodsController < ApplicationController
  before_action :authenticate_user!, :only => [:list, :new]
  before_action :current_user
  def list
    @wallets = Wallet.where(user_id:@current_user.id)
      if @wallets.blank?

        time = Time.new
        @wallet = Wallet.new(user_id:@current_user.id, month:time.month)
        @wallet.save
      end
  end

  def buy
  end

  def orders
  end

  def detail
  end

  def pay
  end

end
