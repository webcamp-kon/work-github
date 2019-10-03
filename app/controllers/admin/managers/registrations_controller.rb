class Admin::Managers::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin_manager!
  protected

  def update_resource(resource, params)
     return super if params["password"]&.present?
      resource.update_without_password(params.except("current_password"))
  end
  def after_update_path_for(resource)
      admin_root_top_path
  end
  private
  def manager_params
			params.require(:manager).permit(:first_name,:last_name,:email)
  end
end
