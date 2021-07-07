class CustomerItemsController < ApplicationController
  def index
    @category_id = params[:category_id]
    @menu_items = MenuItem.where("menu_category_id = ?", @category_id)
  end
end
