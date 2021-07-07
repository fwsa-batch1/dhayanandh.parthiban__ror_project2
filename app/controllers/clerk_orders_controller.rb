class ClerkOrdersController < ApplicationController
  def index
    render "index"
  end

  def create
  end

  def update
    item = Order.find(params[:id])
    item.status = "Delivered"
    item.updated_at = DateTime.now.strftime("%B %d,%Y %l:%M:%S %p")
    item.save!
    redirect_to clerk_orders_path
  end
end
