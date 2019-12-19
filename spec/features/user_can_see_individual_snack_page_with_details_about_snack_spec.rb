require 'rails_helper'

RSpec.describe "snack show page" do
  it "user can see snack price and list of locations snack is available at" do
    owner = Owner.create(name: "Sam's Snacks")
    dons = owner.machines.create(location: "Don's Mixed Drinks")
    bobs = owner.machines.create(location: "Bob's Corner")
    vegas = owner.machines.create(location: "Las Vegas Strip")
    backyard = owner.machines.create(location: "Backyard")


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

    visit snack_path(kitkat)

    expect(page).to have_content("Price: $#{kitkat.price}")
    expect(page).to have_content("Don's Mixed Drinks (#{dons.snacks.count} kinds of snacks, average price of $#{dons.average_snack_price.round(2)})")
    expect(page).to have_content("Las Vegas Strip (#{vegas.snacks.count} kinds of snacks, average price of $#{vegas.average_snack_price.round(2)})")

    raisins = backyard.snacks.create(name: "Raisins", price: 0)

    visit snack_path(raisins)

    expect(page).to have_content("Backyard (1 kind of snack, average price of $0.0)")
  end
end
