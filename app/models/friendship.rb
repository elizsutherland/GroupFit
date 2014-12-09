class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validate :user_cannot_friend_self

  def self.for(possible_user_id, possible_friend_id)
    user_ids = [possible_user_id, possible_friend_id]
    Friendship.find_by(user_id: user_ids, friend_id: user_ids)
  end

  def self.pending
    Friendship.where(confirmed: false)
  end

  private

  def user_cannot_friend_self
    if user_id == friend_id
      errors.add(:base, "User cannot follow self")
    end
  end
end
