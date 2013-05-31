class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :difficulty
      t.text :description
      t.datetime :mikor
      t.integer :user_id
      t.boolean :template
      t.date :mikor_date
      t.integer :period_time
      t.timestamps
    end
  end
end
