# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner = Owner.create(name: "Sam's Snacks")
dons  = owner.machines.create(location: "Don's Mixed Drinks")

kitkat = dons.snacks.create(name: "KitKat", price: 2.50)
snickers = dons.snacks.create(name: "Snickers", price: 3)
reeses = dons.snacks.create(name: "Reese's", price: 1.25)
