class PlacesController < ApplicationController
  def index
    render json: Place.all
  end

  def show
    place = Place.find(params[:id])
    render json: place
  end

  def create
    place = Place.new(
      name: params[:name],
      address: params[:address]
    )
    if place.save
      render json: place
    else
      render json: {errors: place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    place = Place.find(params[:id])
    place.name = params[:name] || place.name
    place.address = params[:address] || place.address
    if place.save
      render json: place
    else
      render json: {errors: place.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    render json: {message: "Place has been deleted."}
  end

end
