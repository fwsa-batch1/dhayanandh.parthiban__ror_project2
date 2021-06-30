class SessionsController < ApplicationController
    skip_before_action :ensure_user_logged_in
  def new
  end

  # owner = User.all.find_by(role: "owner")
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      owner = User.find(user.id) #find id of current user
      if owner.role == "owner" # if the current login user role is owner it redirect to owner page
        session[:current_user_id] = user.id
        redirect_to "/"
      end
    else
      flash[:error] = "Your login attempt was invalid. Please retry."
      redirect_to new_sessions_path
    end
  end

  # def destroy
  #   session[:current_user_id] = nil
  #   @current_user = nil
  #   redirect_to "/"
  # end
end
