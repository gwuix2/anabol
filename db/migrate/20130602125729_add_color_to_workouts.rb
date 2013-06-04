class AddColorToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :color, :string
  end
end
