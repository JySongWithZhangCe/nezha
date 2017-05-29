class WalletController < ApplicationController

 before_action :current_user


  def mywa
    @id=params[:user_id]
    @wallets = Wallet.where(user_id:@current_user.id)
    @wallets.each do |wallet|
        time = Time.new
        if time.month!=wallet.month
          wallet.update(month_pay: 0, month_recharge: 0, month:time.month)
        end
          
    end
  end

 
def vip
end

def card
end

 
  def coupon
  end

  def membercard
  end
end
