class RegistrationsController < Devise::RegistrationsController
  
  # I've left all the unused methods in here as well, but you can
  # easily overwrite any of Devise's methods
  
  def new
    super
  end

  def create
    super
    
  end

  def update
    super
  end
  
  def edit
    super
  end
  
  def destroy
    resource.update_attribute(:active, false)
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    flash[:notice] = "Your account was successfully disabled, we hope to see you again soon!"   
    respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
  end
  
end