class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :item_find_params, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
  end

  def edit
    unless user_signed_in? && @item.user == current_user
      redirect_to action: :index
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
    unless user_signed_in? && @item.user == current_user
      redirect_to action: :index
    end
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :category_id, :text, :price, :delivery_fee_id, :ship_from_location_id, :shipping_date_id, :item_status_id, :image).merge(user_id: current_user.id)
  end

  def item_find_params
    @item = Item.find(params[:id])
  end
end
