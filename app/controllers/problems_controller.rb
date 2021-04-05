class ProblemsController < ApplicationController

  def index
    @problems = Problem.all
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

  private

  def problem_params
    params.require(:problem).permit(:title, :content)
  end

end
