class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, except: [:updateaddress]

  def new
    render "users/new"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]

    users = User.new(name: name, email: email, password: password, role: "user")
    if users.save
      session[:current_user_id] = users.id
      redirect_to customer_menupage_path
    else
      flash[:error] = users.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def updateaddress
    user = @current_user
    add_user = user.address = params[:address]
    if add_user
      if user.save
        redirect_to customer_menuitems_path(category_id: params[:category_id]) and return
      else
        flash[:error] = users.errors.full_messages.join(", ")
        redirect_to customer_menuitems_path(category_id: params[:category_id]) and return
      end
    else
      redirect_to customer_menuitems_path(category_id: params[:category_id]) and return
    end
  end

  def owner
    name = params[:name]
    email = params[:email]
    password = params[:password]
    address = params[:address]
    users = User.new(name: name, email: email, address: address, password: password, role: "owner")
    if users.save
      redirect_to customer_details_path
    else
      flash[:error] = users.errors.full_messages.join(", ")
      redirect_to customer_details_path
    end
  end

  def clerk
    name = params[:name]
    email = params[:email]
    password = params[:password]
    address = params[:address]
    users = User.new(name: name, email: email, password: password, address: address, role: "clerk")
    if users.save
      redirect_to customer_details_path
    else
      flash[:error] = users.errors.full_messages.join(", ")
      redirect_to customer_details_path
    end
  end
end
