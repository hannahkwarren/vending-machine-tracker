class Snack < ApplicationRecord 
  validates :name, presence: :true
  validates :price, presence: :true

  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

end

