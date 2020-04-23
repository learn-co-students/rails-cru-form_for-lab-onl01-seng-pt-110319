class SongsController < ApplicationController

    def index
		@songs = Song.all
	end

	def show
        #byebug
        @song = Song.find(params[:id])
        @artist = @song.artist
        @genre = @song.genre
        #byebug
	end

	def new
		@song = Song.new
	end

	def create
      #byebug
      @song = Song.new(song_params) 
      @song.save
      #byebug
	  redirect_to song_path(@song)
	end

	def update
	  @song = Song.find(params[:id])
	  @song.update(song_params)
	  redirect_to song_path(@song)
	end

	def edit
	  @song = Song.find(params[:id])
    end
    
    private

	def song_params
	    params.require(:song).permit(:name, :artist_id, :genre_id)
    end

end
