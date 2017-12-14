class CommentsController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    question.comments.create(comments_params)
    if question.save
      redirect_to question
    else
      @errors = question.errors.full_messages
      redirect_to question
    end
  end


  def comments_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
