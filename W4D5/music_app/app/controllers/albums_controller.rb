class AlbumsController < ApplicationController
  before_action :ensure_logged_in

  def new
    render :new
  end

  def create
    album = Album.new(album_params)
    if album.save!
      redirect_to album_url(album)
    else
      flash.now[:errors] = album.errors.full_messages
      render :new
    end

  end

  def show
    @album = current_album
    render :show
  end

  def edit
    @album = current_album
    render :edit
  end

  def update
    album = current_album
    album_params.each do |key, val|
      album[key] = val
    end
    if album.save!
      redirect_to album_url(album)
    else
      flash.now[:errors] = album.errors.full_messages
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live?)
  end

  def current_album
    Album.find(params[:id])
  end
end
