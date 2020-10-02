class OrdersController < ApplicationController
  before_action :correct_user

  def index
    @item = Item.find(params[:item_id])
    login_check
    @order = UserDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    login_check
    @order = UserDestination.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :shipping_from_id, :municipalities, :address, :building, :telephone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def login_check
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def correct_user
    redirect_to root_path if request.referer.nil?
  end
end
