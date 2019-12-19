class Snack < ApplicationRecord
  validates_presence_of :name, :price

  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price
    self.average(:price)
  end
end
