class TweetsController < ApplicationController
  before_action :set_proto, only: [:show, :edit]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @tweets = Tweet.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to "/tweets/#{tweet.id}" 
    else
      render action: :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_proto
    @tweet = Tweet.find(params[:id])
  end
  
  def move_to_index
    unless current_user.id == @tweet.user_id
      redirect_to action: :index
    end
  end
end
