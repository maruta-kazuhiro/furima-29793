class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_check, only: [:show, :edit, :update, :destroy]
  before_action :search_item, only: [:index, :search]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @results = @p.result.includes(:item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :category_id, :condition_id, :shipping_fee_id, :shipping_from_id, :date_of_shipment_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = 'ログインしてください'
      redirect_to root_path
    end
  end

  def item_check
    redirect_to root_path unless @item.order.nil?
  end
end

def search_item
  @p = Item.ransack(params[:q]) 
end