class ArtistsController < ApplicationController

    def new
      @artist = Artist.new
    end
  
    def create
      artist = Artist.create(artists_params(:name, :bio))
  
      redirect_to artist
    end
    
    def show
      @artist = Artist.find(params[:id])
    end
  
    def edit
      @artist = Artist.find(params[:id])
    end
  
    def update
      artist = Artist.find(params[:id])
      artist.update(artists_params(:name, :bio))
  
      redirect_to artist
    end
    private
    
    def artists_params(*args)
      params.require(:artist).permit(*args)
    end
  end