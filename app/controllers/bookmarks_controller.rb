class BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    # respond_to do |format|
    #   format.html # Follow regular flow of Rails
    #   format.text { render partial: 'list.html', locals: { movies: @movies } }
    # end

    @goal = Goal.find(params[:goal_id])
    @bookmark = Bookmark.new(goal: @goal)
    authorize @bookmark
    @bookmark.user = current_user
    @bookmarks = Bookmark.all
    @bookmark.save
    render(partial: "shared/bookmarks", locals: { bookmark_info: @bookmarks })
    # if @bookmark.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  def destroy
    @goal = Goal.find(params[:goal_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmarks = Bookmark.all
    p @bookmark.id
    @bookmark.destroy
    render(partial: "shared/bookmarks", locals: { bookmark_info: @bookmarks })
    # redirect_to root_path, status: :see_other
  end
end
