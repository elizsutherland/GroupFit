class WorkoutTimeline
  def initialize(challenge)
    @challenge = challenge
  end

  def workouts_on(date)
    date_workouts.fetch(date, [])
  end

  private

  def date_workouts
    @workouts ||= @challenge.workouts.order("date DESC").group_by(&:date)
  end
end
