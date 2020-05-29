# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# print `rails db:seed:replant`
require "open-uri"

cocktails = %w(Mojito Bloody\ Mary Sex\ on\ the\ Beach Magarita Pina\ Colada)

cocktails.each do |cocktail|
  file_name = "cocktail-0#{(1..3).to_a.sample}.jpeg"
  file = URI.open("app/assets/images/#{file_name}")
  new_cocktail = Cocktail.new(name: cocktail)
  new_cocktail.photo.attach(io: file, filename: file_name, content_type: 'image/jpeg')
  new_cocktail.save!
end

ingredients = %w(Mint Vodka Rum Tequila Orange\ Juice Tomato\ Juice)
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient)
end

# Cocktail.create([{name: "Mojito"}, {name: "Bloody Mary"}, {name: "Sex on the Beach"}, {name: "Magarita"}, {name: "Pina Colada"}])
# Ingredient.create([{name: "Mint"},{name: "Vodka"},{name: "Rum"},{name: "Tequila"},{name: "Orange Juice"},{name: "Tomato Juice"},])

10.times do
  dose = Dose.new(description: Faker::Food.measurement)
  counter = 0
  loop do
    dose.cocktail = Cocktail.find(rand(Cocktail.first.id..Cocktail.last.id))
    dose.ingredient = Ingredient.find(rand(Ingredient.first.id..Ingredient.last.id))
    break if dose.save || counter > 3

    counter += 1
  end
end
