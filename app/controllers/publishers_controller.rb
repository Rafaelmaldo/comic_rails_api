class PublishersController < ApplicationController
  def index
    publishers = Publishers.all
    render json: publishers
  end
end
