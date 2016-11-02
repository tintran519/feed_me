class BountiesController < ApplicationController
  def index
    @user = User.find(current_user.id).hunting
    @bags = Bag.all
    # @bag = Bag.find(params[:id])
  end
end
