class RegistrationsController < Devise::RegistrationsController

	# alias_method :devise_new, :new

	def new
		redirect_to(root_path(anchor: 'signup'), Hash[flash])
	end

	def create
		build_resource

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
			redirect_to(root_path(anchor: 'signup'), {alert: {resource: resource}})
    end		
	end

protected

  def after_sign_in_path_for(user)
  	user_path
  end

  def after_sign_out_path_for(user)
  	root_path
  end

end
