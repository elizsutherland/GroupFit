class WorkoutsController < ApplicationController
  def new
    @challenge = load_challenge_from_url
    @workout = Workout.new
  end

  def create
    @challenge = load_challenge_from_url
    @workout = @challenge.workouts.new(workout_params)

    if @workout.save
      redirect_to @challenge
    else
      render :new
    end
  end

  private

  def load_challenge_from_url
    Challenge.find(params[:challenge_id])
  end

  def workout_params
    params.require(:workout).permit(
      :place,
      :activity,
      :date
    ).merge(user_id: current_user.id)
  end
end
