class ItemsController < ApplicationController
  
  def index
    @Items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

end
