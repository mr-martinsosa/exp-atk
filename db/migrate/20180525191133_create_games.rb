class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :creator
      t.string :genre
      t.integer :average_playtime

      t.timestamps
    end
  end
end
