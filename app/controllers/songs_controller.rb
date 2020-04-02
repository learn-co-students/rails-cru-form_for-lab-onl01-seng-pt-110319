class SongsController < ApplicationController
    before_action :set_song, only: [:show, :update, :edit]

    def index
        @songs = Song.all    
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        # @song.artist = 
        @song.save 
        redirect_to song_path(@song)
    end

    def show
        
    end

    def update
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
