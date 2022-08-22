class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{current_user.first_name}!"
    current_user.is_a?(Admin) ? admin_tests_path : (stored_location_for(resource) || root_path)
  end
end
