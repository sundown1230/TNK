class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def set_locale
	I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :generation, :description, :password, :avatar) }
	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email, :generation, :description, :password, :avatar) }
	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :generation, :description, :password, :avatar) }
  end

  rescue_from Authority::SecurityViolation, with: :authority_forbidden
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    render file: "#{Rails.root}/public/403.html", status: 403, layout: 'error'
  end

end
