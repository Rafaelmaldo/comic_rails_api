class ComicbooksController < ApplicationController
  def index
    comicbooks = Comicbook.all
    render json: comicbooks
  end

  def create
    comicbook = Comicbook.new(comicbook_params)
    if comicbook.save
      render json: comicbook, status: :created
    else
      render json: comicbook.errors, status: :unprocessable_entity
    end
  end

  def destroy
    comicbook = Comicbook.find(params[:id])
    if comicbook.destroy
      render json: { message: 'Comic book deleted successfully' }, status: :ok
    else
      render json: { errors: comicbook.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    comicbook = Comicbook.find(params[:id])
    if comicbook.update(comicbook_params)
      render json: comicbook, status: :ok
    else
      render json: comicbook.errors, status: :unprocessable_entity
    end
  end

  private

  def comicbook_params
    params.require(:comicbook).permit(:title, :number, :description, :artist, :writer, :image_url)
  end
end
