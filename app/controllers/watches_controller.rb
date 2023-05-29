class WatchesController < ApplicationController
  def index
    @watches = Watches.all
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new(params[:watch])
    @watch.save
    redirect_to watch_path(@watch)
  end
end

private

def watch_params
  params.require(:watch).permit(:name, :model, :brand)
end
