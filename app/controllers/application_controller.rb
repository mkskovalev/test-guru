class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  add_flash_types :danger, :info, :warning, :success, :messages

  def default_url_options(options={})
    { lang: ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    flash[:info] = "Привет, #{resource.first_name}!"
    resource.admin? ? admin_tests_path : (stored_location_for(resource) || root_path)
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
