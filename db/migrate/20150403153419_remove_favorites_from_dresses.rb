class RemoveFavoritesFromDresses < ActiveRecord::Migration
  def change
    remove_column :dresses, :favorites, :integer
  end
end
