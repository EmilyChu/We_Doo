class RemoveVotesFromDresses < ActiveRecord::Migration
  def change
    remove_column :dresses, :votes, :integer
  end
end
