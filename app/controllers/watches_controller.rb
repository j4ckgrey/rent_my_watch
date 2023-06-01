class WatchesController < ApplicationController

  before_action :set_watch, only: %i[edit update]

  def show
    @watch = Watch.find(params[:id])
    @rental = Rental.new
  end

  def new
    @watch = Watch.new
  end

  def toggle_available_status
    @available = false
    @available.toggle!(:enabled)
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user = current_user
    # if @watch.photos[0] == ""
    #   image_path = "assets/images/default.png"
    #   @watch.photos[0] = image_path
    # end
    if @watch.save
      redirect_to watch_path(@watch)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy
    redirect_to root_path, status: :see_other
  end

  def edit
  end

  def update
    if @watch.update(watch_params)
      redirect_to watch_path(@watch)
    else
      render :edit, status: :unprocessable_entity
    end
  end
end

private

def watch_params
  params.require(:watch).permit(:name, :model, :brand, :price, :description, photos: [])
end

def set_watch
  @watch = Watch.find(params[:id])
end
