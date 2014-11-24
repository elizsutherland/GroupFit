class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id, null:false
      t.integer :challenge_id, null: false
      t.string :place
      t.date :date, null: false
      t.string :activity

      t.timestamps null: false
    end
  end
end
