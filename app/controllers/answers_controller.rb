class AnswersController < ApplicationController
  def create
    if params[:question_id].present?
      question = Question.find(params[:question_id])
      answer = question.answers.new(answers_params)
      if answer.save
        redirect_to question
      else
        @errors = answer.errors.full_messages
        redirect_to question, notice: 'No se permiten comentarios ni respuestas en blanco o vacias, intente de nuevo'
      end
    end 
  end

  def answers_params
    params.require(:answer).permit(:body).merge(user: current_user)
  end
end
