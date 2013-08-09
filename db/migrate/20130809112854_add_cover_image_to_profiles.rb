class AddCoverImageToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :cover_image, :string
  end
end
