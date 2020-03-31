class SongsController < ApplicationController

  before_action :set_song, except: [:index, :new, :create]
  def index 
    @songs = Song.all 
  end

  def new 
    @song = Song.new 
  end

  def create
    @song = Song.new(name: params[:song][:name], artist_id: params[:song][:artist_id], genre_id: params[:song][:genre_id])
    if @song.save
      redirect_to song_path(@song)
    else
      new_song_path
    end
  end

  def show 
  end

  def edit

  end

  def update
    @song.update(song_params(:name))
    redirect_to song_path(@song)
  end

  private 
  def set_song 
    @song = Song.find_by(id: params[:id])
  end

  def song_params(*arg)
    params.require(:song).permit(*arg)
  end
end
