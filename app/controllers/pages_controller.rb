class PagesController < ApplicationController
  def home
    @watches = Watch.all
  end

  def dashboard
    @user = current_user
    @mywatches = current_user.watches
    @myrentals = current_user.rentals
  end
end
