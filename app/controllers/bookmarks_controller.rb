class BookmarksController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark][:url]

    @topic = Topic.find(params[:topic_id])

    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark was saved"
      redirect_to topics_path
    else
      flash[:error] = "There was an error, try again"
      redirect_to :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark destroyed"
      redirect_to topics_path
    else 
      flash[:error] = "There was an error, try again"
      redirect_to :show
    end

  end

end
