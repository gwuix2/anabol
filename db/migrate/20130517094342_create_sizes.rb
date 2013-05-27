class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.integer :user_id
      t.integer :nyak
      t.integer :vall
      t.integer :mell
      t.integer :kar
      t.integer :alkar
      t.integer :derek
      t.integer :csipo
      t.integer :comb
      t.integer :vadli
      t.integer :testsuly
      t.integer :testzsir

      t.timestamps
    end
  end
end
