class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.belongs_to :dress

      t.timestamps null: false
    end
  end
end
