# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# print `rails db:seed:replant`

Cocktail.create([{name: "Mojito"}, {name: "Bloody Mary"}, {name: "Sex on the Beach"}, {name: "Magarita"}, {name: "Pina Colada"}])
Ingredient.create([{name: "Mint"},{name: "Vodka"},{name: "Rum"},{name: "Tequila"},{name: "Orange Juice"},{name: "Tomato Juice"},])

10.times do
  dose = Dose.new(description: Faker::Food.measurement)
  counter = 0
  loop do
    dose.cocktail = Cocktail.find(rand(1..5))
    dose.ingredient = Ingredient.find(rand(1..5))
    break if dose.save || counter > 3

    counter += 1
  end
end
