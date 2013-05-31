class AddPrivateToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :private, :boolean
  end
end
