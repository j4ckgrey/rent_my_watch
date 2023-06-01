class PagesController < ApplicationController
  def home
    if current_user.nil?
      @watches = Watch.all
      if params[:query].present?
        sql_subquery = <<~SQL
          watches.name @@ :query
          OR watches.brand @@ :query
          OR watches.model @@ :query
          OR watches.description @@ :query
        SQL
        @watches = @watches.where(sql_subquery, query: params[:query])
      end
    else
      @pick = []
      @watches = Watch.all
      if params[:query].present?
        sql_subquery = <<~SQL
          watches.name @@ :query
          OR watches.brand @@ :query
          OR watches.model @@ :query
          OR watches.description @@ :query
        SQL
        @watches = @watches.where(sql_subquery, query: params[:query])
      end
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

  def rental_requests
    @user = current_user
    @watches = @user.watches
  end
end
