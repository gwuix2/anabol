class AddSlugToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :slug, :string, unique: true
  end
end
