class CartItemsController < ApplicationController

    def create
      menuid= params[:id]
      quantity = params[:quantity]
      CartItem.create!(menu_item_id:menuid, quantity:quantity,user_id:@current_user.id)
      redirect_back(fallback_location:"/")
    end

    def update
      cart_item = current_user.cart_items.find_by(menu_item_id: params[:id])
      puts "+++++++++++++++++++++++++++++++++++++++#{params[:quantity]}+++++++++++++++"
      puts "+++++++++++++++++++++++++++++++++++++++#{cart_item.quantity}"
      if cart_item && params[:quantity] == "1"
        puts "+++++++++++++++++++++++++++++++++++++++#{cart_item.quantity}+++++++++++++++"
        cart_item.quantity += 1
      elsif(cart_item && cart_item.quantity > 0)
        cart_item.quantity -= 1
      else
        flash[:error]="something went wrong"
      end
      cart_item.save!


      # if params[:check] != "yes"
      #   cart_item.quantity += 1
      # elsif(cart_item)
      #   if cart_item.quantity >= 1
      #     cart_item.quantity -= 1
      #   else
      #     cart_item.quantity =0
      #   end
      #   cart_item.save!
      # end
      redirect_back(fallback_location:"/")
    end

    def destroy
      cart_item = CartItem.find_by(menu_item_id: params[:id])
      cart_item.destroy
      redirect_back(fallback_location:"/")
    end
end
