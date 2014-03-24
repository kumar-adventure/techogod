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
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if update_resource(resource, user_parameters)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end  
  
  private
  def user_parameters
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :account_type_id, :current_password)
  end
end