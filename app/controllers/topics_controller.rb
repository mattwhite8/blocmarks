class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    #authorize @topic
  end

  def new
    @topic = Topic.new
    #authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    #authorize @topic
  end

  def create
    @topic = Topic.new
    @topic.user = current_user
    @topic.title = params[:topic][:title]
    #authorize @topic
    if @topic.save
      redirect_to topics_path, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]
    @topic.user = current_user
    #authorize @topic
    if @topic.save
      redirect_to topics_path, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    title = @topic.title
    #authorize @topic

    if @topic.destroy 
      flash[:notice] = "\"#{title}\" was deleted sucessfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      redirect_to :show
    end
  end

  private
  
  def topic_params
    params.require(:topic).permit(:title, :user_id)
  end

end
