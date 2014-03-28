class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_account_type
  def check_account_type
    redirect_to assign_user_type_users_path if current_user && current_user.account_type_id.blank?
  end
end
