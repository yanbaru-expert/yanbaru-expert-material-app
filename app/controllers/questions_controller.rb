class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :approval_user!

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result.order(:genre).order(id: :desc)
    @all_questions = Question.order(:genre).select(:genre).distinct
  end

  def show
    @question = Question.find(params[:id])
  end
end
