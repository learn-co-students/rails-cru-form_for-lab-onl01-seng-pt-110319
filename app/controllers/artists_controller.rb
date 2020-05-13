class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :update, :edit]

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        @artist.save 
        redirect_to artist_path(@artist)
    end

    def show
        
    end

    def update
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end

    private

    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
end