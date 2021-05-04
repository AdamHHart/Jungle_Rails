class ProductsController < ApplicationController
  # http_basic_authenticate_with name: ENV["username"], password: ENV["password"], except: :index
  # before_filter :authorize
  
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
