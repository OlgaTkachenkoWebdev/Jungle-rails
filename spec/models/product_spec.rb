require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new({name: "Bush"})
    @product = Product.new({name: "new", price: 1.99, quantity:1, category: @category})
  end

  describe 'Validations' do
    
    it "should be saved if all fields are set" do
      @product.save
      expect(@product).to be_present
    end

    it "should return error message if name is not valid" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages.first).to eq("Name can't be blank")
    end

    it "should return error message if price is not valid" do
      @product.price = nil
      @product.save
      expect(@product.errors.full_messages.first).to eq("Price must be greater than 0")
    end

    it "should return error message if quantity is not valid" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages.first).to include("Quantity can't be blank")
    end

    it "should return error message if category is not valid" do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages.first).to eq("Category must exist")
    end

  end
end
