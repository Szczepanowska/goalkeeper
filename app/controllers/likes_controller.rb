class LikesController < ApplicationController
  before_action :find_goal
  def create
    @like = Like.where(goal_id: params[:goal_id])
    authorize @like
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @goal.likes.create(user_id: current_user.id)
    end
    redirect_to goal_path(@goal)
  end

  def destroy
    @like = @goal.likes.find(params[:id])
    authorize @like
    if already_liked?
      @like.destroy
    else
      flash[:notice] = "Cannot unlike"
    end
    redirect_to goal_path(@goal)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, goal_id:
    params[:goal_id]).exists?
  end

  def find_goal
    @goal = Goal.find(params[:goal_id])
  end
end
