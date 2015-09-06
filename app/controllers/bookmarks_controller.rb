class BookmarksController < ApplicationController
  after_action :verify_authorized, :except => :index


  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark][:url]

    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic

    @bookmark.user = current_user

    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved"
      redirect_to topics_path
    else
      flash[:error] = "There was an error, try again"
      redirect_to :new
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.url = params[:bookmark][:url]
    authorize @bookmark

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
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark destroyed"
      redirect_to topics_path
    else 
      flash[:error] = "There was an error, try again"
      redirect_to :show
    end

  end

end
