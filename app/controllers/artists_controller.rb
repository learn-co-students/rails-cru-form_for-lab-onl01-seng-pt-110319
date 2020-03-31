class ArtistsController < ApplicationController

  before_action :set_artist, except: [:index, :new, :create]
  def index 
    @artists = Artist.all 
  end

  def new 
    @artist = Artist.new 
  end

  def create
    @artist = Artist.new(name: params[:artist][:name], bio: params[:artist][:bio])
    if @artist.save
      redirect_to artist_path(@artist)
    else
      new_artist_path
    end
  end

  def show 
  end

  def edit

  end

  def update
    @artist.update(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  private 
  def set_artist 
    @artist = Artist.find_by(id: params[:id])
  end

  def artist_params(*arg)
    params.require(:artist).permit(*arg)
  end
end
