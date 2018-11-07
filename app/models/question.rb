class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy
  has_many :votes, as: :voteable, :dependent => :destroy

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false

  def voted_by? (user)
    votes.exists?(user: user)
  end
end
