class ArtistsController < ApplicationController 

    def show 
        @artist = Artist.find(params[:id])
    end

    def new 
        @artist = Artist.new
      
    end

    def create 

        @artist = Artist.new(artist_params)
        @artist.save 
        redirect_to artist_path(@artist)
    end

    def edit 
        @artist = Artist.find_by(:id => params[:id])

    end

    def update 
        @artist = Artist.find_by(:id => params[:id])
        @artist.update(artist_params)
        @artist.save 
        redirect_to artist_path(@artist)
    end

    def index 
        @artists = Artist.all
    end 

    private 

    def artist_params
        params.require(:artist).permit(:name)
    end
end