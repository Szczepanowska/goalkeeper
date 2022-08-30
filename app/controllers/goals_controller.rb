class GoalsController < ApplicationController


  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    if @goal.save
      redirect_to user_path(@goal.user)
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :category, :start_date, :end_date)
  end

end
