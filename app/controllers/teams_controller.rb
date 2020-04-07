class TeamsController < ApplicationController
  before_action :authenticate_team!
  
  def show
    @team = Team.find(params[:id])
    @posts = Post.where(team_id: @team).order(updated_at: :desc).page(params[:page]).per(5)
  end
end
