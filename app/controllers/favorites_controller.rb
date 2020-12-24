class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find_params, only: [:create, :destroy]
  before_action :find_favorite_params, only: [:destroy]

  def create
    binding.pry
    @favorite = Favorite.new(favorite_params)
    @favorite.save
    render
  end

  def destroy
    @favorite.destory
  end

  private
  
  def favorite_params
    params.require(:favorite).merge(user_id: current_user.id, item_id: @item.id)
  end

  def item_find_params
    @item = Item.find(params[:id])
  end

  def find_favorite_params
    @favorite = Favorite.find(params[:id])
  end
end
