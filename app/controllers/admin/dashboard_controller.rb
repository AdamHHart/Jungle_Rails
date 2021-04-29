class Admin::DashboardController < ApplicationController
  

  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]



  def show

    @category_count = Category.all.count
    @product_count = Product.all.count
    puts @product_count
    puts @category_count
  end

end
