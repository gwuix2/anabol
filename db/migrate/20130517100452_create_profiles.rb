class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :magassag
      t.integer :nem
      t.string :gym
      t.string :varos
      t.integer :user_id

      t.timestamps
    end
  end
end
