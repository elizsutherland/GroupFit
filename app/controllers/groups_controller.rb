class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      GroupMembership.create(group: @group, user: current_user, admin: true)
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @group = load_group_from_url
    @users = @group.users
    @challenge = @group.current_challenge
    @challenges = @group.challenges
    @timeline = WorkoutTimeline.new(@challenge)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to group
  end

  def destroy
    @group = load_group_from_url
    @group.destroy
    redirect_to groups_path
  end
  private

  def group_params
    params.require(:group).
      permit(:title)
  end

  def load_group_from_url
    Group.find(params[:id])
  end
end
