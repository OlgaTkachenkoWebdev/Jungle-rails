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
      expect(@product.errors.full_messages).not_to be_equal([])
    end

    it "should return error message if price is not valid" do
      @product.price = nil
      expect(@product.errors.full_messages).not_to be_equal([])
    end

    it "should return error message if quantity is not valid" do
      @product.quantity = nil
      expect(@product.errors.full_messages).not_to be_equal([])
    end

    it "should return error message if category is not valid" do
      @product.category = nil
      expect(@product.errors.full_messages).not_to be_equal([])
    end

  end
end
