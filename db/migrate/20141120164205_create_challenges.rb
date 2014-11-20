class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :statement
      t.integer :group_id, null: false
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :current, default: false, null: false

      t.timestamps null: false
    end
  end
end
