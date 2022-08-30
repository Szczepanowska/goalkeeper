class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = current_user.goals
    @tasks = Task.find_by(goal_id: @goals)
  end

  def new
    @goal = Goal.new
  end

  def show
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path, status: :see_other
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :category, :start_date, :end_date, :user)
  end
end
