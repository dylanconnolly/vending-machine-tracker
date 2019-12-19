require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "relationships" do
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe "#average_snack_price" do
    it "returns average price of its snacks" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      bobs = owner.machines.create(location: "Bobs Corner")

      kitkat = dons.snacks.create(name: "KitKat", price: 2.50)
      snickers = dons.snacks.create(name: "Snickers", price: 3)
      reeses = dons.snacks.create(name: "Reese's", price: 1.25)

      bobs.snacks << kitkat
      bobs.snacks << snickers

      expect(dons.average_snack_price).to eq(2.25)
      expect(bobs.average_snack_price).to eq(2.75)
    end
  end
end
