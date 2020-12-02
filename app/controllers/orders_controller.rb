class OrdersController < ApplicationController
  before_action :item_find_params, only: [:index, :create]

  def index
    @purchaser_destination = PurchaserDestination.new
  end

  def create
    @purchaser_destination = PurchaserDestination.new( purchaser_destination_params )
    if @purchaser_destination.valid?
      # pay_item
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
    params.require(:purchaser_destination).permit(:postal, :prefecture_id, :municipalities, :address, :building, :telephone_number).merge( user_id: current_user.id, item_id: @item.id )
  end
  
  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: @item.price,
  #     card: order_params[:token],    
  #     currency: 'jpy' 
  #   )
  # end
end
