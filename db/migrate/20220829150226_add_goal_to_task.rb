class AddGoalToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :goal, null: false, foreign_key: true
  end
end
