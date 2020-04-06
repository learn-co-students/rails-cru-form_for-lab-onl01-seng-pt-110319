class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    find_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to_artist_path
  end

  def edit
    find_artist
  end

  def update
    find_artist
    @artist.update(artist_params)
    redirect_to_artist_path
  end


  private

  # def artist_params(*args)
  #   params.require(:artist).permit(*args)
  # end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def redirect_to_artist_path
    redirect_to artist_path(@artist)
  end

end
