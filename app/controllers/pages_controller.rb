class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @goals = Goal.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @goals = Goal.all
    end
  end
end
