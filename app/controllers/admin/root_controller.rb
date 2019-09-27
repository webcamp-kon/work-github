class Admin::RootController < ApplicationController
  before_action :authenticate_admin_manager!
  def top
  end
end
