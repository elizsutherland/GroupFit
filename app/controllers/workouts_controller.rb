class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new 
  end

  def create
    @workout = Workout.new(workout_params)
    
    if @workout.save
      redirect_to @group
    else
      render :new
    end
  end

  private

  def workout_params
    params.require(:workout).permit(
      :place,
      :activity,
      :date
    )
  end
end
