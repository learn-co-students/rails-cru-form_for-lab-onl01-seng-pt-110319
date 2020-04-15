class ArtistsController < ApplicationController
    def show
        @artist = Artist.find(params[:id])
    end

    def index
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(with_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.update(with_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def with_params(*args)
        params.require(:artist).permit(*args)
    end
end