class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
  def ensure_owner
    unless @current_user.role == "owner"
      redirect_to customer_menupage_path
    end
  end
  def add_order_items(order_id)
    puts "********************************* #{@cartitems.first.id}********************"
    @cartitems.each do |item|
      menuitem = MenuItem.find(item.menu_item_id)
      OrderItem.create!(menu_item_id:item.menu_item_id,price: menuitem.price,quantity: item.quantity,order_id: order_id)
    end
    @cartitems.destroy_all
  end
end
