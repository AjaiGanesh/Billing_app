class Product < ApplicationRecord
  validates :name, :product_code, :stock, :price, :tax, presence: true
  validates :product_code, uniqueness: { case_sensitive: false }
  validates :stock, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    message: "must be 0 or more"
  }
  validates :price, numericality: {
    greater_than: 0,
    message: "must be greater than 0"
  }
  validates :tax, numericality: {
    greater_than_or_equal_to: 0,
    message: "must be 0 or more"
  }

end
