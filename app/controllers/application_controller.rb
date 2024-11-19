class ApplicationController < ActionController::Base
  before_action :basci_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :birth, :last_name, :last_name_katakana,
                                                       :name, :name_katakana])
  end

  def basci_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
