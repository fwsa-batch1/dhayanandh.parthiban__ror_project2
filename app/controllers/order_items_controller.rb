class OrderItemsController < ApplicationController
  def index
    if params[:order_id]
      order = Order.find(params[:order_id])
      if order.user_id == @current_user.id || @current_user.role == "owner"
         @order_items = order.order_items
      end
    end
    # render plain: params[:order_id].present?
  end

  def create
    price = 0.0
    quantity = 0
    id = 0
    order_items = 0
    create_order_items = true
    @current_user.cart_items.each do |orderitem|
      price = MenuItem.find(orderitem.menu_item_id).price
      id = MenuItem.find(orderitem.menu_item_id).id
      quantity = orderitem.quantity
      order_items = OrderItem.new(order_id: params[:order_id], price: price, quantity: quantity, menu_item_id: id)
      create_order_items = order_items.save
      break unless create_order_items
    end
    if create_order_items
      @current_user.cart_items.destroy_all
      redirect_to order_items_path(category_id: params[:category_id], order_id: params[:order_id])
    else
      redirect_to orders_path(category_id: params[:category_id])
    end
  end

  def show
    redirect_to order_items_path(category_id: params[:category_id])
  end
end
