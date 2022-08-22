class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(resource)
    current_user.is_a?(Admin) ? admin_tests_path : (stored_location_for(resource) || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
  end
end
