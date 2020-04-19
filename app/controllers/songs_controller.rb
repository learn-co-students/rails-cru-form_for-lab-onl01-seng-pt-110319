class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    find_and_set_song
    @genre = @song.genre
    @artist = @song.artist
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(post_params)
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    find_and_set_song
  end

  def update
    find_and_set_song
    @song.update(post_params)
    redirect_to song_path(@song)
  end

private

  def post_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

  def find_and_set_song
    @song = Song.find(params[:id])
  end

end
