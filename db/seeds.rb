require 'json'

User.destroy_all
Game.destroy_all
Category.destroy_all

20.times.map do
  User.create!( :name       => Faker::Name.first_name,
                :email      => Faker::Internet.email,
                :password   => 'a' )
end

categories_arry = ["Card Games", "Strategy", "Classic", "Puzzle", "Adventure", "Dice Games"]
categories_arry.map! do |game|
  Category.create!(:name => game )
end
#
# 10.times.map do |i|
#   Game.create!(body: Faker::Lorem.paragraph,
# 				       title: Faker::Lorem.sentence,
#                num_players: rand(4),
#                category_id: categories_arry.sample.id)
# end



# Boardgame.all[0].destroy
json = JSON.parse(File.read('bgg_collection_seed.json'))

json.each do |game|
  # p game['name']
  @game = Game.new
  @game[:title] = game['name'] if game['name'] != nil
  @game[:body] = Faker::Lorem.paragraph
  @game[:image_url] = game['image'] if game['image'] != nil
  @game[:thumbnail_url] = game['thumbnail'] if game['thumbnail'] != nil
  @game[:min_players] = game['minPlayers'] if game['minPlayers'] != nil
  @game[:max_players] = game['maxPlayers'] if game['maxPlayers'] != nil
  @game[:playing_time] = game['playingTime'] if game['playingTime'] != nil
  @game[:category_id] = categories_arry.sample.id
  @game.save
  # Game.create!(game[:name])
end
