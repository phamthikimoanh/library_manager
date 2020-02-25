class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :phone, :address, :birthday])
    # update_attrs = [:name, :phone, :address, :birthday]
    # devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end