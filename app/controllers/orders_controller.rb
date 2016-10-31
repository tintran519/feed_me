class OrdersController < ApplicationController
  def index
    @bag = Bag.find(params[:bag_id])
    @user = @bag.user
    @orders = @bag.orders
  end

  def create
  end

  def new
    # @user = User.find(params[:user_id])
    # @bag = @user.bags.new
    @bag = Bag.find(params[:bag_id])
    @user = @bag.user
    @order = @bag.orders.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
