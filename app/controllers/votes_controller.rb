class VotesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    if params[:question_id].present?
      question = Question.find(params[:question_id])
      question.votes.create(user: current_user)

      redirect_to question
    elsif params[:answer_id].present?
      answer = Answer.find(params[:answer_id])
      answer.votes.create(user: current_user)

      redirect_to answer.question
    end
  end

  def destroy
    if params[:question_id].present?
      question = Question.find(params[:question_id])
      question.votes.where(user: current_user).take.try(:destroy)

      redirect_to question
    elsif params[:answer_id].present?
      answer = Answer.find(params[:answer_id])
      answer.votes.where(user: current_user).take.try(:destroy)

      redirect_to answer.question
    end
  end
end
