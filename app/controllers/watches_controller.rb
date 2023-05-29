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
    @watch = Watch.new(params[:watch])
    @watch.save
    redirect_to watch_path(@watch)
  end

  def top
    @watch = Watch.all.sample
  end
end

private

def watch_params
  params.require(:watch).permit(:name, :model, :brand)
end
