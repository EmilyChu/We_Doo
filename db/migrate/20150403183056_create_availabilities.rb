class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :name
      t.datetime :start_at

      t.timestamps null: false
    end
  end
end
