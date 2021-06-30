class MenuCategoriesController < ApplicationController
  def index
    render "menu_category/index"
  end
  def create
    category_name = params[:name]
    category = MenuCategory.new(name:category_name, status: true)

    if category.save
      redirect_to menu_categories_path
    else
      flash[:error] = category.errors.full_messages.join(", ")
      redirect_to menu_categories_path
    end
  end

  def update
    id = params[:id]
    name = params[:name]
    category = MenuCategory.find(id)
    category.update(name: name)
    category.save
    redirect_to menu_categories_path
  end

  # def update
  #   render "menu_category/edit_category"
  # end

  def destroy
    id = params[:id]
    category = MenuCategory.find(params[:id])
    category.destroy
    redirect_to menu_categories_path
  end
end
