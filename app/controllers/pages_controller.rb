class PagesController < ApplicationController
  def home
    @watches = Watch.all
  end
end
