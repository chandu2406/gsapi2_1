# app/controllers/sessions_controller.rb
 
class SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in_and_redirect(resource_name, resource)
  end
 
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:token => resource.authentication_token}
  end
  
  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end

  protected

  def after_sign_up_path_for(resource)
    '/login'
  end

end