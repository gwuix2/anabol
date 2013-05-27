class AddMoreToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :description, :text
    add_column :profiles, :motivation, :text
    add_column :profiles, :real_name, :string
    add_column :profiles, :sport, :string
    add_column :profiles, :user_name, :string
    add_column :profiles, :gym_routine, :text
    add_column :profiles, :nutrition, :text
  end
end
