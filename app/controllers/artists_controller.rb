class ArtistsController < ApplicationController

    def new 
        @artist=Artist.new
    end 

    def create 
        @artist=Artist.create(artist_params)
        redirect_to artist_path(@artist)
    end 

    def edit 
        @artist=Artist.find(params[:id])
    end

    def update 
        @artist=Artist.update(artist_params)

        redirect_to artist_path(@artist)
    end 

    def show 
        @artist=Artist.find(params[:id])
    end 

    def index 
        "it works"
        
    end

    private 

    def artist_params
        params.require(:artist).permit!
    end
end
