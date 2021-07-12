class OrdersController < ApplicationController
  def index
    render "index"
  end

  def create
    if @current_user.cart_items.present?
      if @current_user.role == "clerk"
        create_orders = Order.new(user_id: @current_user.id, status: "Delivered")
      else
        create_orders = Order.new(user_id: @current_user.id, status: "pending")
      end
      if create_orders.save

        redirect_to orders_path(category_id: params[:category_id])
      else
        redirect_to customer_menuitems_path(category_id: params[:category_id])
      end
    else
      flash[:error] = "Your cart is Empty"
      redirect_back(fallback_location: "/")
    end
  end

  def update
    item = Order.find(params[:order_id])
    item.status = "Delivered"
    item.updated_at = DateTime.now.strftime("%B %d,%Y %l:%M:%S %p")
    item.save!
    redirect_to customer_details_path
  end
end
