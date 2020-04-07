class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result.find_newest_post(params[:page]).with_team_and_comment
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :representative, :homepage, :location_and_day, :introduction, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :representative, :homepage, :location_and_day, :introduction, :image])
  end
end
