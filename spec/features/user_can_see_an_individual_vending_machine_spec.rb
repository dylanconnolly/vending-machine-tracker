require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "the user sees a list of that vending machine's snacks" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    kitkat = dons.snacks.create(name: "KitKat", price: 2.50)
    snickers = dons.snacks.create(name: "Snickers", price: 3)
    reeses = dons.snacks.create(name: "Reese's", price: 1.25)

    visit machine_path(dons)

    expect(page).to have_content(kitkat.name)
    expect(page).to have_content(kitkat.price)
    expect(page).to have_content(snickers.name)
    expect(page).to have_content(snickers.price)
    expect(page).to have_content(reeses.name)
    expect(page).to have_content(reeses.price)
  end

  it "the user sees the average price of the snacks for that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    kitkat = dons.snacks.create(name: "KitKat", price: 2.50)
    snickers = dons.snacks.create(name: "Snickers", price: 3)
    reeses = dons.snacks.create(name: "Reese's", price: 1.25)

    visit machine_path(dons)

    expect(page).to have_content("Average price: $2.25")
  end
end
