class Group < ActiveRecord::Base
  validates :title, presence: :true

  has_many :challenges
  has_many :group_memberships
  has_many :users, through: :group_memberships

  def current_challenge
    challenges.order("created_at desc").first
  end
end
