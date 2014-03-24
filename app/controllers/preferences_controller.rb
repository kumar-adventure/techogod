class PreferencesController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def search_user
  	@users = []
  	# find account type 
  	account_type = AccountType.where(name: params[:user_preference][:name]).first
  	return if account_type.blank?
  	return unless params[:user_preference][:afinity] 
  	#Find users list according to given filter
  	params[:user_preference][:afinity].each do |afinity|
  		user_afinity = Afinity.where(name: afinity).first
  		@users << user_afinity.users.where("users.account_type_id =?", account_type.id) if user_afinity.present?
  	end
  	return @users = @users.flatten.uniq
  end
  
  def set_preference
  end

  def save_preference
  	if params[:afinity]
  		current_user.user_preferences.destroy_all
  		params[:afinity].each do |afinity_name|
  			afinity = Afinity.where(name: afinity_name).first
  			current_user.user_preferences.create(afinity_id: afinity.id)
  		end
  		flash[:notice] = "Your setting has been updated successfully."
  	else
  		if current_user.user_preferences.present?
  			current_user.user_preferences.destroy_all
  			flash[:notice] = "Your setting has been deleted successfully"
  		end
  	end
  	redirect_to set_preference_preferences_path
  end

end
