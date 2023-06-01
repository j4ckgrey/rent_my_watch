class PagesController < ApplicationController
  def home
    @watches = Watch.all
  end

  def dashboard
    @user = current_user
    @mywatches = current_user.watches
    @myrentals = current_user.rentals
  end

  def rental_requests
    @user = current_user
    @watches = @user.watches
  end
end
