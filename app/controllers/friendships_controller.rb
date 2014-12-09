class FriendshipsController < ApplicationController
  def create
    friend = load_friend_from_url
    friend_request = current_user.friendships.new(friend_id: friend.id)
    if friend_request.save
      redirect_to friend
    end
  end

  def update
    friend = load_friend_from_url
    friendship = Friendship.for(current_user.id, friend.id)
    friendship.update(confirmed: params[:confirmed])
    redirect_to friend
  end

  def destroy
    friend = load_friend_from_url
    Friendship.for(current_user.id, friend.id).destroy
    redirect_to friend
  end

  private

  def load_friend_from_url
    User.find(params[:user_id])
  end
end
