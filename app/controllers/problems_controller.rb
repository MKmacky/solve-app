class ProblemsController < ApplicationController
  before_action :search_category, only: [:index, :search]

  def index
    @problems = Problem.all.order(created_at: :desc)
    search_category
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

  def search
    @results = @p.result.order(created_at: :desc)
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :content, :category_id).merge(user_id: current_user.id)
  end

  def search_category
    @p = Problem.ransack(params[:q])
  end
end
