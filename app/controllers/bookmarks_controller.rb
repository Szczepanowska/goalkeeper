class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @bookmark = Bookmark.new(goal: @goal)
    authorize @bookmark
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    authorize @bookmark
    @bookmark.destroy
    redirect_to home_path, status: :see_other
  end
end
