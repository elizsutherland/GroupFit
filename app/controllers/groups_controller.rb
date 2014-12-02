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
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @challenge = @group.current_challenge
    @challenges = @group.challenges
    @timeline = WorkoutTimeline.new(@challenge)
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end
end
