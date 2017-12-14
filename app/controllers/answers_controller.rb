class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    question.answers.create(answers_params)

    redirect_to question
  end

  def answers_params
    params.require(:answer).permit(:body).merge(user: current_user)
  end
end
