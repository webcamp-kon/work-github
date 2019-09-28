class Admin::Managers::RegistrationsController < Devise::RegistrationsController
  before_action :guard_signup!, only: [cancel new destroy create]
 protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  private

  def guard_signup!
    raise ActionController::RoutingError, 'NOT FOUND'
  end
end