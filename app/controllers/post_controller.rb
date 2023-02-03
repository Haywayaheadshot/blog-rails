class PostController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @latest_posts = @user.latest_posts
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.all
  end
end
