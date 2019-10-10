class Admin::Managers::RegistrationsController < Devise::RegistrationsController

  before_action :guard_signup!, only: [:cancel,:new,:destroy,:create]
 protected
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
 
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end
    # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  protected
  def update_resource(resource, params)
     return super if params["password"]&.present?
      resource.update_without_password(params.except("current_password"))
  end
  def after_update_path_for(resource)
      admin_root_top_path
  end
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name, :email, :password, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:last_name,:first_name, :email, :password, :password_confirmation])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def manager_params
			params.require(:manager).permit(:first_name,:last_name,:email,:password,:password_confirmation)
  end
end
