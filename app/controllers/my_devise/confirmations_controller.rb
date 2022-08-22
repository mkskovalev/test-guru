class MyDevise::ConfirmationsController < Devise::ConfirmationsController

  protected

  def after_confirmation
    if signed_in?
      set_flash_message! :notice, :confirmed, :first_name => resource.first_name
    end
  end
end
