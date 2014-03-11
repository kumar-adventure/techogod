class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(user_parameters)
		if resource.save
		  if resource.active_for_authentication?
		    set_flash_message :notice, :signed_up if is_navigational_format?
		    sign_in(resource_name, resource)
		    respond_with resource, :location => after_sign_up_path_for(resource)
		  else
		    set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
		    expire_session_data_after_sign_in!
		    respond_with resource, :location => after_inactive_sign_up_path_for(resource)
		  end
		else
		  clean_up_passwords resource
		  respond_with resource
		end
  end

  def update
    super
  end
  
  private
  def user_parameters
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :account_type_id)
  end
end