class Challenge < ActiveRecord::Base
  belongs_to :group
  has_many :workouts
end
