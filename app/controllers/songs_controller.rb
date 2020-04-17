class SongsController < ApplicationController

    def index
      @songs = Song.all
    end
  
    def new
      @song = Song.new
    end
  
    def create
      @song = Song.new(songs_params(:name))
      artist = Artist.find_or_create_by(id: params[:song][:artist])
      genre = Genre.find_or_create_by(id: params[:song][:genre])
  
      
      @song.artist_id = artist.id
      @song.genre_id = genre.id
      @song.save
      redirect_to @song
    end
  
    def show
      @song = Song.find(params[:id])
    end
  
    def edit
      @song = Song.find(params[:id])
    end
  
    def update
      @song = Song.find(params[:id])
      artist = Artist.find_or_create_by(id: params[:song][:artist])
      genre = Genre.find_or_create_by(id: params[:song][:genre])
  
      @song.name = songs_params(:name)
      @song.artist_id = artist.id
      @song.genre_id = genre.id
      @song.save
      
      redirect_to @song
    end
  
    private
    
    def songs_params(*args)
      params.require(:song).permit(*args)
    end
  
  end