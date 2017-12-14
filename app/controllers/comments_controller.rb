class CommentsController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    question.comments.create(comments_params)

    redirect_to question
  end

  def comments_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
