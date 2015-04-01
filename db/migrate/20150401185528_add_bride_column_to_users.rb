class AddBrideColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bride, :boolean, default: false 
  end
end
