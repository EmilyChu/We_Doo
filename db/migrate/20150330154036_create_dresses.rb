class CreateDresses < ActiveRecord::Migration
  def change
    create_table :dresses do |t|
      t.belongs_to  :user
      t.integer     :votes

      t.timestamps null: false
    end
  end
end
