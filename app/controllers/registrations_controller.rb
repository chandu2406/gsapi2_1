class RegistrationsController < Devise::RegistrationsController

	def create
    build_resource(sign_up_params)
    puts resource.inspect
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        puts "here and true"
        render :status => 200, :json => {:token=> resource.authentication_token}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        puts "here and "
        expire_session_data_after_sign_in!
        render :status => 200, :json => {:token=> resource.authentication_token}
      end
    else
      puts resource.email
      clean_up_passwords resource
      return render :status => 200, :json => resource.errors.messages.to_json
    end
  end
 
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    true
  end


  protected

  def after_sign_up_path_for(resource)
   	'/login'
  end
end