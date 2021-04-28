class Admin::DashboardController < ApplicationController
  

  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  # before_filter :authenticate

  def show
  end
end
