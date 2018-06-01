# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
client = Twitch::Client.new client_id: "#{ENV["TWITCH_CLIENT"]}"

games = client.get_games({name: ["Fortnite", "Super Mario Odyssey", "League of Legends", "Naruto Shippuden: Ultimate Ninja Storm 4", "Destiny 2", "Path of Exile", "Grand Theft Auto V", "Battlefield 1", "Overwatch", "MapleStory", "MLB The Show 18", "Rocket League", "Call of Duty: WWII", "NBA 2K18", "The Witcher 3: Wild Hunt"]}).data
games.each do |game|
    Game.create(name: game.name, box_art_url: game.box_art_url)
end