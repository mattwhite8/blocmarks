class LikesController < ApplicationController
  after_action :verify_authorized, :except => :index

  
  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)

     authorize like
     if like.save
        flash[:notice] = "Liked!"
        redirect_to @bookmark.topic
      else
        flash[:error] = "Error!"
        redirect_to @bookmark.topic
     end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.where(bookmark_id: @bookmark.id).first

    authorize like
    if like.destroy
      flash[:notice] = "Unliked!"
      redirect_to @bookmark.topic
    else
      flash[:error] = "Error!"
      redirect_to @bookmark.topic
    end
  end
end
