class AddSlugToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :slug, :string
  end
end
