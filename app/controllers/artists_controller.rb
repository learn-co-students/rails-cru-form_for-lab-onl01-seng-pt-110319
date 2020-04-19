class ArtistsController < ApplicationController

  def show
    find_and_set_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(post_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def edit
    find_and_set_artist
  end

  def update
    find_and_set_artist
    @artist.update(post_params)
    redirect_to artist_path(@artist)
  end


  private

  def post_params
    params.require(:artist).permit(:name, :bio)
  end

  def find_and_set_artist
    @artist = Artist.find(params[:id])
  end
end
