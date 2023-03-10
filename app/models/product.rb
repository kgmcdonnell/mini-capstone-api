class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  validates :price, presence: true, numericality: { greater_than: 0 }

  validates :description, presence: true, length: { in: 10..500 }

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  belongs_to :supplier

  # def images
  #   Image.where(product_id: id)
  # end
  has_many :images
end
