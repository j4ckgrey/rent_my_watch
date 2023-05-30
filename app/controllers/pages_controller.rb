class PagesController < ApplicationController
  def home
    @watches = Watch.all
  end

  def dashboard
    @user = current_user
  end
end
