# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Owner.destroy_all
Machine.destroy_all
Snack.destroy_all

owner = Owner.create(name: "Sam's Snacks")
dons = owner.machines.create(location: "Don's Mixed Drinks")
bobs = owner.machines.create(location: "Bob's Corner")
vegas = owner.machines.create(location: "Las Vegas Strip")

kitkat = dons.snacks.create(name: "KitKat", price: 2.50)
snickers = dons.snacks.create(name: "Snickers", price: 3)
reeses = dons.snacks.create(name: "Reese's", price: 1.25)
popcorn = bobs.snacks.create(name: "Overprice Popcorn", price: 13.50)
veggies = bobs.snacks.create(name: "Assorted Veggies", price: 4)
drink = vegas.snacks.create(name: "Shitty Tequila", price: 15)

dons.snacks << popcorn
bobs.snacks << drink
bobs.snacks << snickers
vegas.snacks << kitkat
vegas.snacks << snickers
