class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string  :category
      t.integer :cost

      t.timestamps null: false
    end
  end
end
