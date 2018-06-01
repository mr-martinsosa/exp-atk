class UpdateGamesTable < ActiveRecord::Migration[5.2]
  def change
      remove_column(:games, :description)
      remove_column(:games, :price)
      remove_column(:games, :creator)
      remove_column(:games, :genre)
      remove_column(:games, :average_playtime)

      add_column(:games, :box_art_url, :string)
  end
end