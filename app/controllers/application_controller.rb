class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_user, :logged_in?

    protected
  
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:first_name,:first_name_kana,:last_name_kana,:last_name,:address_id,:is_deleted,:telephone_number,:post_number,:address])
      end
	helper_method :current_user, :logged_in?
end
