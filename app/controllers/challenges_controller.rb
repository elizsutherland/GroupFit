class ChallengesController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = load_group_from_url
    @challenge = Challenge.new
  end

  def create
    @group = load_group_from_url
    @challenge = @group.challenges.new(challenge_params)

    if @challenge.save
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @workouts = @challenge.workouts.order("date desc")
  end

  private

  def load_group_from_url
    Group.find(params[:group_id])
  end

  def challenge_params
    params.require(:challenge).permit(
      :title,
      :statement,
      :start_date,
      :end_date
    )
  end
end
