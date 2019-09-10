class Admin::Managers::RegistrationsController < Devise::RegistrationsController
  before_action :guard_signup!, only: [cancel new destroy create]

  private

  def guard_signup!
    raise ActionController::RoutingError, 'NOT FOUND'
  end
end