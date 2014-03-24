class UsersController < ApplicationController

  def profile
  	@user = User.where(id: params[:user_id]).first
    if @user.blank?
      flash[:error] = "User does not exists."
      redirect_to root_url
    end 
  end

end
