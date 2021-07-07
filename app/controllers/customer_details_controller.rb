class CustomerDetailsController < ApplicationController
  def index
    if @current_user.role == "owner"
      render "index"
    else
      redirect_back(fallback_location: "/")
    end
  end
end
