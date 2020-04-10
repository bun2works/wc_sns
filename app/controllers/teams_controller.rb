class TeamsController < ApplicationController
  before_action :authenticate_team!

  def index
    @teams = Team.with_attached_image.order(updated_at: :desc).page(params[:page]).per(18)
  end
  
  def show
    @team = Team.with_attached_image.find(params[:id])
    @posts = Post.where(team_id: @team).order(updated_at: :desc).page(params[:page]).per(10)
  end
end
