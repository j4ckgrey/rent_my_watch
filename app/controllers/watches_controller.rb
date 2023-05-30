class WatchesController < ApplicationController
  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(watch_params)
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
end

private

def watch_params
  params.require(:watch).permit(:name, :model, :brand, :photo, :description)
end
