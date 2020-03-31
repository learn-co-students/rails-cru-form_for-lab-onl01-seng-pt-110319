class GenresController < ApplicationController

  before_action :set_genre, except: [:index, :new, :create]
  def index 
    @genres = Genre.all 
  end

  def new 
    @genre = Genre.new 
  end

  def create
    @genre = Genre.new(name: params[:genre][:name])
    if @genre.save
      redirect_to genre_path(@genre)
    else
      new_genre_path
    end
  end

  def show 
  end

  def edit

  end

  def update
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  private 
  def set_genre 
    @genre = Genre.find_by(id: params[:id])
  end

  def genre_params(*arg)
    params.require(:genre).permit(*arg)
  end
end
