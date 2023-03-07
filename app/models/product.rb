class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  validates :price, numericality: { greater_than: 0 }

  validates :description, length: { minimum: 10, maximum: 500 }
end
