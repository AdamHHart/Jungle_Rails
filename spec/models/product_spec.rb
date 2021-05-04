require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.new(name: "Test_Category")
      @product = Product.new(name: "Guitar", price_cents: 1000, quantity: 1, :category => @category)
    end

    it "should create and save a new product if validated" do
      @product.valid?
      expect(@product.errors).not_to include("anything")
    end

    it "should have a name" do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include("can\'t be blank")
    end

    it "should have a price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:price_cents]).to include("is not a number")
    end

    it "should have a quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:quantity]).to include("can\'t be blank")
    end
    
    it "should have a category" do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:category]).to include("can\'t be blank")
    end

  end
end