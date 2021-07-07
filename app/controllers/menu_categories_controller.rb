class MenuCategoriesController < ApplicationController
  # skip_before_action :ensure_user_logged_in
  before_action :ensure_owner
  # ,except: :index

  def index
    render "menu_category/index"
  end

  def create
    category_name = params[:name]
    category = MenuCategory.new(name: category_name, status: true)

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

  def updatemenustatus
    id = params[:category_id]
    status = params[:status]
    menu = MenuCategory.find(id)
    menu.status = status
    menu.save!
    redirect_to menu_categories_path
  end

  def destroy
    id = params[:id]
    category = MenuCategory.find(params[:id])
    category.destroy
    redirect_to menu_categories_path
  end

  # private
  # def owner?
  #   @current_user.role == "owner"
  # end
end
