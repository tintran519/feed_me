class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
        if user.is_hunter
          redirect_to bounties_path(user)
        else
          redirect_to user_path(user)
        end
    else
      flash.now.alert = 'Invalid login credentials - try again!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
