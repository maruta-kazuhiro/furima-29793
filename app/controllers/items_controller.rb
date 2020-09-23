class ItemsController < ApplicationController
  
  def index
    @Items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :condition_id, :shipping_fee_id, :shipping_from_id, :date_of_shipment_id, :image).merge(user_id: current_user.id)
  end

end
