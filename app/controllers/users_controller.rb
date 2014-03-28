class UsersController < ApplicationController
  skip_before_filter :check_account_type
  
  def profile
  	@user = User.where(id: params[:user_id]).first
    if @user.blank?
      flash[:error] = "User does not exists."
      redirect_to root_url
    end 
  end
  
  def assign_user_type
  end
  
  def create_user_type
    if current_user.update_attributes(account_type_id: params[:account_type_id])
      flash[:success] = "account type was added successfully"
      redirect_to root_path and return
    else
      flash[:error] = "account type was not added successfully please try again"
      redirect_to assign_user_type_users_path and return
    end
  end

end
