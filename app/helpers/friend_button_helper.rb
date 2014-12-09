module FriendButtonHelper
  def friend_button(user)
    if current_user.friends.include?(user)
      unfriend_button(user)
    elsif current_user.pending_friends.include?(user)
      pending_button
    elsif user.pending_friends.include?(current_user)
      accept_friend_button(user)
    else
      add_friend_button(user)
    end
  end

  private

  def friendship(user)
    Friendship.for(user.id, current_user.id)
  end

  def pending_button
    button_to "Friend Request Pending", {}, disabled: true
  end

  def unfriend_button(user)
    button_to "Unfriend",
      [user, friendship(user)], method: :delete
  end

  def accept_friend_button(user)
    button_to "Accept Friend Request",
      [user, friendship(user), confirmed: true], method: :patch
  end

  def add_friend_button(user)
    button_to "Send Friend Request", user_friendships_path(user)
  end
end
