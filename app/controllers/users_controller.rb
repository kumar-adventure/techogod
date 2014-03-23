class UsersController < ApplicationController

  def show
  	@user = User.where(id: params[:id]).first
    if @user.blank?
      flash[:error] = "User does not exists."
      redirect_to root_url
    end 
  end

end
