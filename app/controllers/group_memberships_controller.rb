class GroupMembershipsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @group.users << current_user

    redirect_to :back
  end

  def destroy
    membership = GroupMembership.find(params[:id])
    membership.destroy

    redirect_to groups_path
  end
end
