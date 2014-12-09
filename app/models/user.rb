class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :image_url, presence: true

  has_many :group_memberships
  has_many :groups, through: :group_memberships
  has_many :workouts
  has_many :likes
  has_many :liked_workouts, through: :likes, source: :workout
  has_many :friendships
  has_many :friends, through: :friendships

  def membership_for(group)
    group_memberships.where(group_id: group.id).first
  end

  def self.all_except(user)
    where.not(id: user)
  end

  def likes?(workout)
    liked_workouts.include?(workout)
  end

  def friends
    friend_ids = Friendship.
      where(user_id: id, confirmed: true).
      pluck(:friend_id)
    friend_ids += Friendship.
      where(friend_id: id, confirmed: true).
      pluck(:user_id)
    User.where(id: friend_ids)
  end

  def pending_friends
    pending_friend_ids = Friendship.pending.
      where(user_id: id).
      pluck(:friend_id)
    User.where(id: pending_friend_ids)
  end
end
