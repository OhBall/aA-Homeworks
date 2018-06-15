class BandsController < ApplicationController
  before_action :ensure_logged_in

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    band = Band.new(band_params)
    if band.save!
      redirect_to band_url(band.id)
    else
      flash.now[:errors] = band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    band = Band.find(params[:id])

    if band
      # band_params.each do |k,v|
      #   band.k
      # end
      band.name = band_params[:name]
      if band.save!
        redirect_to band_url(band.id)
      else
        flash[:errors] = band.errors.full_messages
        redirect_to :edit
      end
    end
  end

  def destroy
    #should add something to check that you "own " this band
    band = Band.find(params[:id])
    band.delete
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
