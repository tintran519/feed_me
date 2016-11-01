class OrdersController < ApplicationController
  def index
    @bag = Bag.find(params[:bag_id])
    @user = @bag.user
    @orders = @bag.orders
  end

  def new
    @bag = Bag.find(params[:bag_id])
    @user = @bag.user
    @order = @bag.orders.new
  end

  def create
    @bag = Bag.find(params[:bag_id])
    @user =@bag.user
    @order = @bag.orders.new(order_params)
    if @order.save
      redirect_to user_bag_orders_path(@user, @bag)
    else
      render 'new'
  end
end

  def show
    @order = Order.find(params[:id])
    @bag = @order.bag
    @user = @bag.user
  end

  def edit
  end


  def update
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to user_bag_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:uom, :food_id, :quantity)
  end
end
