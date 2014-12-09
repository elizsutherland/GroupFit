class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end

validate :user_cannot_friend_self

def self.for(possible_user_id, possible_friend_id)
  user_ids = [possible_user_id, possible_friend_id]
  Friendship.find_by(user_id: user_ids, friend_id: user_ids)
end

def self.pending
  Friendship.where(confirmed: false)
end

private

def user_cannot_buddy_self
  if user_id == buddy_id
    errors.add
  end
end
