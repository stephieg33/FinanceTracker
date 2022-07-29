class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Following User"
    else
      flash[:alert] = "Something went wrong with the tracking request"
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    destroy_name = User.where(id: params[:id]).first
    friendship.destroy
    flash[:alert] = "Stopped following #{destroy_name.first_name}"
    redirect_to my_friends_path
  end
end
