class AboutController < ApplicationController

  before_filter :authorize

  def index
    @category_count = Category.all.count
    @product_count = Product.all.count
    puts @product_count
    puts @category_count
  end
end
