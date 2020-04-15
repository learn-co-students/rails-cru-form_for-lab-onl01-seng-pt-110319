class GenresController < ApplicationController
    def show
        @genre = Genre.find(params[:id])
    end

    def index
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(with_params(:name))
        redirect_to genre_path(@genre)
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(with_params(:name))
        redirect_to genre_path(@genre)
    end

    private

    def with_params(*args)
        params.require(:genre).permit(*args)
    end
end