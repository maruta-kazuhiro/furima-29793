class DestinationController < ApplicationController
  def new
    @destination = UserDestination.new
  end

  def create
    @destination = UserDestination.new(destination_params)
    if @donation.valid?
      @donation.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def destination_params
    params.permit(:postal_code, :shipping_from_id, :municipalities, :address, :building, :telephone_number).merge(order_id: oreder.id)
  end
end
