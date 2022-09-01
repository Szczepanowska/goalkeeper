class LikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]
  before_action :find_goal

  def create
    @like = Like.where(goal_id: params[:goal_id])
    authorize @like
    if current_user&.already_liked_goal?(@goal)
      flash[:notice] = "You can't like more than once"
    elsif current_user
      @goal.likes.create(user: current_user)
    else
      @goal.likes.create
    end
    redirect_to goal_path(@goal)
  end

  def destroy
    @like = @goal.likes.find(params[:id])
    authorize @like
    if current_user&.already_liked_goal?(@goal)
      @like.destroy
    else
      flash[:notice] = "Cannot unlike"
    end
    redirect_to goal_path(@goal)
  end

  private

  def find_goal
    @goal = Goal.find(params[:goal_id])
  end
end
