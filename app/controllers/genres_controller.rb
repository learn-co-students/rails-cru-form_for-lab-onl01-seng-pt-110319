class GenresController < ApplicationController

  def show
    find_and_set_genre
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(post_params)
    @genre.save
    redirect_to genre_path(@genre)
  end

  def edit
    find_and_set_genre
  end

  def update
    find_and_set_genre
    @genre.update(post_params)
    redirect_to genre_path(@genre)
  end


  private

  def post_params
    params.require(:genre).permit(:name)
  end

  def find_and_set_genre
    @genre = Genre.find(params[:id])
  end
end
