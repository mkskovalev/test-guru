class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{resource.first_name}!"
    resource.admin? ? admin_tests_path : (stored_location_for(resource) || root_path)
  end
end
