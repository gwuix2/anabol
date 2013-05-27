class AddAttributesToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :nem2, :string
    add_column :profiles, :date_of_birth, :integer
  end
end
