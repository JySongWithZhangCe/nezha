class OrdersController < ApplicationController

 before_action :current_user

  def index
    @orders = Order.where(user_id:@current_user.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    # @order.update(user_id: 7)    
    @order.update(user_id: @current_user.id)

    @wallets = Wallet.where(user_id:@current_user.id)
    @wallets.each do |wallet|
        @month_pay = wallet.month_pay+@order.cost
        @balance = wallet.balance - @order.cost
           wallet.update(month_pay: @month_pay, balance: @balance)
    end

    if @order.save
        redirect_to @order
    else
        render 'new'
    end

  end
  

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  
    redirect_to  orders_path
  end


  private
  def order_params
    params.require(:order).permit(:cost,:category, :address)
  end

end
