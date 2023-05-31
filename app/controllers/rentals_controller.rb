class RentalsController < ApplicationController
  def new
    @watch = Watch.find(params[:watch_id])
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @watch = Watch.find(params[:watch_id])
    @rental.watch = @watch
    @rental.user = current_user
    if @rental.save
      redirect_to watch_path(@watch)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.required(:rentals).permit(:start_date, :end_date)
  end
end
