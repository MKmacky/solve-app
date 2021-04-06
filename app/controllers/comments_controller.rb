class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/problems/#{comment.problem.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:solution).merge(user_id: current_user.id, problem_id: params[:problem_id])
  end
end
