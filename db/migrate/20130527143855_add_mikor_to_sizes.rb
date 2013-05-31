class AddMikorToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :mikor, :date
  end
end
