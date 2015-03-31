class AddNameToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :name, :string
  end
end
