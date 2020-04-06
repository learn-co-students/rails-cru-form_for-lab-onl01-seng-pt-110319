class GenresController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    find_genre
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to_genre_path
  end

  def edit
    find_genre
  end

  def update
    find_genre
    @genre.update(genre_params)
    redirect_to_genre_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end

  def redirect_to_genre_path
    redirect_to genre_path(@genre)
  end
end
