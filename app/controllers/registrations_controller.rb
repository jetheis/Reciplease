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
  
  def update
    super
  end
  
  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_navigational_format?
    respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
  end
  
end