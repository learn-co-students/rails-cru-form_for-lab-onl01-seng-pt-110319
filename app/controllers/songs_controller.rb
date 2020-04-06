class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    find_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.save
    redirect_to_song_path
  end

  def edit
    find_song
  end

  def update
    find_song
    @song.update(song_params)
    redirect_to_song_path
  end

  private

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def redirect_to_song_path
    redirect_to song_path(@song)
  end
end
