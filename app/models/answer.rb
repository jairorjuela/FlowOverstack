class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :body, presence: true, allow_blank: false

  def voted_by? (user)
    votes.exists?(user: user)
  end

end
