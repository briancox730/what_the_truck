class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :vote, inclusion: { in: ["none", "up", "down"] }

  def after_vote
    count = 0
    self.vote == "up" ? count = 1 : count = -1
    self.review.votes_count += count
  end

  def after_change_vote
    count = 0
    self.vote == "up" ? count = 2 : count = -2
    self.review.votes_count += count
  end

  def after_destroy
    count = 0
    self.vote == "up" ? count = 1 : count = -1
    self.review.votes_count -= count
  end
end
