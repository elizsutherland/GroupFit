class LikesController < ApplicationController
  def create
    workout = load_workout_from_url
    workout.likes.create(user_id: current_user.id)
    redirect_to :back
  end

  def destroy
    workout = load_workout_from_url
    workout.likes.where(user_id: current_user.id).first.destroy
    redirect_to :back
  end

  private

  def load_workout_from_url
    Workout.find(params[:workout_id])
  end
end
