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
    @rental.status = "pending"
    @watch.user.notification += 1
    if @rental.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.status = (params[:rental][:status])
    @rental.save
    redirect_to rental_requests_path, status: :see_other
  end

  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy
    redirect_to rental_requests_path, status: :see_other
  end

  private

  def rental_params
    params.required(:rental).permit(:start_date, :end_date)
  end
end
