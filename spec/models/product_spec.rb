require 'rails_helper'

RSpec.describe Product, type: :model do
describe 'Validations' do
  it "creates a new product object with a name" do
  product = Product.new(name: "banana")
  expect(product.name).to eq("banana")
end
it "creates a new product object with a price" do
  product = Product.new(price_cents: 99)
  expect(product.price_cents).to eq(99)
end
it "creates a new product object with a quantity" do
  product = Product.new(quantity: 19)
  expect(product.quantity).to eq(19)
end
it "creates a new product object with a category" do
  product = Product.new(category_id: 1)
  expect(product.category_id).to eq(1)
end
it "sets all fields to a value" do
  product = Product.new(name: "banana", price_cents: 99, quantity: 19, category_id: 1)
  expect(product.name).not_to eq(nil)
  expect(product.price_cents).not_to eq(nil)
  expect(product.quantity).not_to eq(nil)
  expect(product.category_id).not_to eq(nil)
end
it "sets all fields to a value with name nil" do
  category = Category.create(name: "abc")
  product = Product.create(name: nil, price_cents: 99, quantity: 19, category: category)
  expect(product.errors.full_messages).to include("Name can't be blank")
end
end
end

