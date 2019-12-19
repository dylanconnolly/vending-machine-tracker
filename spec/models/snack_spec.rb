require 'rails_helper'

RSpec.describe Snack do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
  end

  describe "relationships" do
    it {should have_many :machine_snacks}
    it {should have_many(:machines).through(:machine_snacks)}
  end

  describe "#average_price" do
    it "returns average price of snacks in collection" do
      kitkat = Snack.create(name: "KitKat", price: 2.50)
      snickers = Snack.create(name: "Snickers", price: 3)
      reeses = Snack.create(name: "Reese's", price: 1.25)

      expect(Snack.average_price).to eq(2.25)


      popcorn = Snack.create(name: "Popcorn", price: 5)

      expect(Snack.average_price).to eq(11.75/4)
    end
  end
end
