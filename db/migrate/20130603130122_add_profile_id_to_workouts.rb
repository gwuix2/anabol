class AddProfileIdToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :profile_id, :integer
  end
end
