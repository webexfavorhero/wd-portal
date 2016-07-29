class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
  
  def show
    @product = Product.find_by_plan_id(params[:id])
    @order_item = current_order.order_items.new
  end
end