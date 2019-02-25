class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @users = User.all
  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.create(comment_params)
    redirect_to user_path(@user)
 
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
