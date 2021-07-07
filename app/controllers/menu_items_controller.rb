class MenuItemsController < ApplicationController
  before_action :ensure_owner

  def index
    @category = MenuCategory.find(params[:category_id])
    @menu_items = MenuItem.where("menu_category_id = ?", params[:category_id])

    # @item = MenuItem.new(menu_category_id: params[:category_id])
  end

  def create
    # MenuItem.create!(item_params)
    menuitems = MenuItem.new(name: params[:name], description: params[:description], price: params[:price], status: true, menu_category_id: params[:category_id])
    if menuitems.save
      redirect_to menu_items_path(category_id: params[:category_id])
    else
      flash[:error] = menuitems.errors.full_messages.join(", ")
      redirect_to menu_items_path(category_id: params[:category_id])
    end
    # @item = MenuItem.new(item_params)
    # @item.save!

  end

  def update
    id = params[:id]
    name = params[:name]
    description = params[:description]
    price = params[:price]
    item = MenuItem.find(id)
    item.update(name: name)
    item.update(price: price)
    item.update(description: description)
    # item.update(status:true)
    completed = params[:status]
    menu = MenuItem.find(id)
    menu.status = completed
    item.save
    redirect_to menu_items_path(category_id: params[:category_id])
  end

  def updateitemstatus
    item_id = params[:menu_id]
    status = params[:status]
    menu = MenuItem.find(item_id)
    menu.status = status
    menu.save!
    redirect_to menu_items_path(category_id: params[:category_id])
  end

  def destroy
    id = params[:id]
    item = MenuItem.find(params[:id])
    item.destroy
    redirect_to menu_items_path(category_id: params[:category_id])
  end

  # private
  # def item_params
  #   params.require(:menu_item).permit(:name,:price,:description,:menu_category_id)
  # end
end
