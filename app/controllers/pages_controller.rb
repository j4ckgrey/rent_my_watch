class PagesController < ApplicationController
  def home
    if current_user.nil?
      @watches = Watch.all
    else
      @pick = []
      @watches = Watch.all
      @watches.each do |watch|
        @pick << watch if watch.user_id != current_user.id
      end
    end
  end

  def dashboard
    @user = current_user
    @mywatches = current_user.watches
    @myrentals = current_user.rentals
  end
end
