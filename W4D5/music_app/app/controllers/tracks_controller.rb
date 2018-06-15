class TracksController < ApplicationController
  before_action :ensure_logged_in

  def new
    render :new
  end

  def create
    track = Track.new(track_params)
    if track.save
      redirect_to track_url(track)
    else
      flash.now[:error] = track.errors.full_messages
      render :new
    end
  end

  def show
    @track = current_track
    render :show
  end

  def edit
    @track = current_track
    render :edit
  end

  def update
    track = current_track
    track_params.each { |k,v| track[k] = v }
    if track.save
      redirect_to track_url(track)
    else
      flash_errors
      render :edit
    end

  end

  private
  def track_params
    params.require(:track).permit(:title, :ord, :bonus, :lyrics, :album_id)
  end

  def current_track
    Track.find(params[:id])
  end

  def flash_errors
    flash.now[:error] = track.errors.full_messages
  end
end
