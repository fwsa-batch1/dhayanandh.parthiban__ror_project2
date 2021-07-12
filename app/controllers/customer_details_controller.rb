class CustomerDetailsController < ApplicationController
  def index
    if @current_user.role == "owner"
      # flash[:error] = "jkfehkjfh"
      if params[:from_date].present?
         @orders = Order.where("created_at between ? and ?", params[:from_date], DateTime.parse(params[:to_date]) + 1)
      else
        @orders = Order.all
      end
      render "index"
    else
      redirect_back(fallback_location: "/")
    end
  end
end
