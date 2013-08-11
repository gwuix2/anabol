class AddSokmindenToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :description, :text
    add_column :photos, :testsuly, :integer
    add_column :photos, :testzsir, :integer
    add_column :photos, :keszult, :date
  end
end
