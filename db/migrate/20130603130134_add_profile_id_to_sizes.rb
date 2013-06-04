class AddProfileIdToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :profile_id, :integer
  end
end
