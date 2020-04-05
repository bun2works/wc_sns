class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :representative, :homepage, :location_and_day, :introduction, :team_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :representative, :homepage, :location_and_day, :introduction, :team_image])
  end
end
