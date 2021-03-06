class OrdersController < ApplicationController
  before_action :item_find_params, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    if user_signed_in? && (@item.user == current_user||@item.purchaser.present?)
      redirect_to root_path
    end
    @purchaser_destination = PurchaserDestination.new
  end

  def create
    @purchaser_destination = PurchaserDestination.new( purchaser_destination_params )
    if @purchaser_destination.valid?
      pay_item
      @purchaser_destination.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def item_find_params
    @item = Item.find(params[:id])
  end

  def purchaser_destination_params
    params.permit(:postal, :prefecture_id, :municipalities, :address, :building, :telephone_number).merge( user_id: current_user.id, item_id: @item.id, token: params[:token] )
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchaser_destination_params[:token],    
      currency: 'jpy' 
    )
  end
end
