class AddFavoritesColumnToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :favorites, :string
  end
end
