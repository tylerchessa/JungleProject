require 'rails_helper'

RSpec.describe Product, type: :model do
describe 'Validations' do
  category = Category.create(name: "food")
  let(:product){Product.new(name: "banana", price_cents: 99, quantity: 19, category: category)}
  it "is not valid without a name" do
    product.name = nil
    expect(product).to_not be_valid
    product.save
    expect(product.errors.full_messages).to include("Name can't be blank")
  end
  it "is not valid without a price" do
    product.price_cents= nil
    expect(product).to_not be_valid
    product.save
    expect(product.errors.full_messages).to include("Price can't be blank")
  end
  it "is not valid without a quantity" do
    product.quantity = nil
    expect(product).to_not be_valid
    product.save
    expect(product.errors.full_messages).to include("Quantity can't be blank")
  end
  it "is not valid without a category" do
    product.category = nil
    expect(product).to_not be_valid
    product.save
    expect(product.errors.full_messages).to include("Category can't be blank")
  end
  it "sets all fields to a value with name nil" do
    category = Category.create(name: "abc")
    product = Product.create(name: nil, price_cents: 99, quantity: 19, category: category)
    expect(product.errors.full_messages).to include("Name can't be blank")
  end
end
end


