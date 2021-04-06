class CommentsController < ApplicationController

  def index
    @comment = Comment.new
    @problem = Problem.find(params[:porblem_id])
  end

  def create
    @problem = Problem.find(params[:problem_id])
    @comment = @problem.comment.new(comment_params)
    if @comment.save
      redirect_to problem_comments_path(@problem)
    else
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:solution).merge(user_id: current_user.id)
  end
end
