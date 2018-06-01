class RemovePostIdToGames < ActiveRecord::Migration[5.2]
  def change
    remove_column(:games, :post_id)
  end
end
