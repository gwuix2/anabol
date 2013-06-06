class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
      t.string :v
      t.text :description

      t.timestamps
    end
  end
end
