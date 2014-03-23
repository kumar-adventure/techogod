class PreferencesController < ApplicationController
  def index
  end

  def search_user
  	@users = []
  	account_type = AccountType.where(name: params[:user_preference][:name]).first
  	return if account_type.blank?
  	params[:user_preference][:afinity].each do |afinity|
  		user_afinity = Afinity.where(name: afinity).first
  		@users << user_afinity.users.where("users.account_type_id =?", account_type.id) if user_afinity.present?
  	end
  	return @users = @users.flatten.uniq
  end

end
