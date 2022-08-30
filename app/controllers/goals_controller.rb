class GoalsController < ApplicationController
  def home
  end

  def index
    @goals = current_user.goals
  end
end
