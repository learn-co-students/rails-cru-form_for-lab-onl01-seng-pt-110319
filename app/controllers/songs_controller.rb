class SongsController < ApplicationController

  def index
    @songs=Song.all
  end

  def show
    @song=Song.find(params[:id])
  end

  def new
    @song=Song.new
    @artists=Artist.all.sort_by(&:name)
    @genres=Genre.all.sort_by(&:name)
  end

  def create
    @song=Song.create(post_params(:song,[:name,:artist_id,:genre_id]))
    redirect_to song_path(@song)
  end

  def edit
    @song=Song.find(params[:id])
  end

  def update
    @song=Song.find(params[:id])
    @song.update(post_params(:song,[:name,:artist_id,:genre_id]))
    redirect_to song_path(@song)
  end

end
