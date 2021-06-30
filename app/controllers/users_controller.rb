class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def new
    render "users/new"
  end

  def create
    name = params[:first_name]
    email = params[:email]
    password = params[:password]

    users = User.new(name: name, email: email, password:password)
    if users.save
      session[:current_user_id] = users.id
      redirect_to "/"
    else
      flash[:error] = users.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
