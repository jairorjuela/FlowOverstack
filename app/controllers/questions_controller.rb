class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)

    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)

    redirect_to questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :body).merge(user_id: current_user.id)
    end
end
