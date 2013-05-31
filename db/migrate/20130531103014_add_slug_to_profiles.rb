class AddSlugToProfiles < ActiveRecord::Migration
  def change
    add_index :profiles, :slug, unique: true
  end
end
