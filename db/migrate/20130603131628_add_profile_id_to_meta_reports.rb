class AddProfileIdToMetaReports < ActiveRecord::Migration
  def change
    add_column :meta_reports, :profile_id, :integer
  end
end
