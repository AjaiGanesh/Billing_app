require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:valid_attributes) do
    {
      name: "Pen",
      product_code: "PEN001",
      stock: 10,
      price: 15.0,
      tax: 5.0
    }
  end

  def build_product(overrides = {})
    Product.new(valid_attributes.merge(overrides))
  end

  it "is valid with all attributes" do
    expect(build_product).to be_valid
  end

  it "is invalid without a name" do
    product = build_product(name: nil)
    expect(product).not_to be_valid
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a product_code" do
    product = build_product(product_code: nil)
    expect(product).not_to be_valid
    expect(product.errors[:product_code]).to include("can't be blank")
  end

  it "is invalid without stock" do
    product = build_product(stock: nil)
    expect(product).not_to be_valid
    expect(product.errors[:stock]).to include("can't be blank")
  end

  it "is invalid without price" do
    product = build_product(price: nil)
    expect(product).not_to be_valid
    expect(product.errors[:price]).to include("can't be blank")
  end

  it "is invalid without tax" do
    product = build_product(tax: nil)
    expect(product).not_to be_valid
    expect(product.errors[:tax]).to include("can't be blank")
  end

  it "is invalid with non-unique product_code (case-insensitive)" do
    build_product.save!
    duplicate = build_product(name: "Another", product_code: "pen001")
    expect(duplicate).not_to be_valid
    expect(duplicate.errors[:product_code]).to include("has already been taken")
  end

  it "is invalid with negative stock" do
    product = build_product(stock: -1)
    expect(product).not_to be_valid
    expect(product.errors[:stock]).to include("must be 0 or more")
  end

  it "is invalid with zero or negative price" do
    expect(build_product(price: 0)).not_to be_valid
    expect(build_product(price: -5)).not_to be_valid
  end

  it "is invalid with negative tax" do
    product = build_product(tax: -2)
    expect(product).not_to be_valid
    expect(product.errors[:tax]).to include("must be 0 or more")
  end
end
