class ProblemsController < ApplicationController
  def index
    @problems = Problem.all.order(created_at: :desc)
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @problem = Problem.find(params[:id])
    @comment = Comment.new
    @comments = @problem.comments.includes(:user)
  end

  def destroy
    problem = Problem.find(params[:id])
    problem.destroy
    redirect_to root_path
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :content, :category_id).merge(user_id: current_user.id)
  end
end
