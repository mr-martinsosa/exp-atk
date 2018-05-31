class AddGameIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :game_id, :integer
  end
end
