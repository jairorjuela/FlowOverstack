class CommentsController < ApplicationController

  def create
    if params[:question_id].present?
      question = Question.find(params[:question_id])
      coment = question.comments.new(comments_params)
      if coment.save
        redirect_to question
      else
        @errors = coment.errors.full_messages
        redirect_to question, notice: 'No se permiten comentarios ni respuestas en blanco o vacias, intente de nuevo'
      end
    elsif params[:answer_id].present?
      answer = Answer.find(params[:answer_id])
      coment = answer.comments.new(comments_params)
      if coment.save
        redirect_to answer.question
      else
        @errors = coment.errors.full_messages
        redirect_to answer.question, notice: 'No se permiten comentarios ni respuestas en blanco o vacias, intente de nuevo'
      end
    else
      @errors = answer.errors.full_messages
    end
  end


  def comments_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
