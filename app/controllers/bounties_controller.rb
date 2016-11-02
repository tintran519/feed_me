class BountiesController < ApplicationController
  def index
    @user = User.find(current_user.id).hunting
    @bags = Bag.all
    # @bag = Bag.find(params[:id])
  end

  # def update
  #   @bags = Bag.all
  #   bag.hunter_name = @current_user.name
  # end
end
