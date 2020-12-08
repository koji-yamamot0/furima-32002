class FavoritesController < ApplicationController
  before_action :item_find_params, only: [:create, :destroy]
  before_action :find_favorite_params, only: [:destroy]
  
  def create
    @favorite = Favorite.create(favorite_params)
  end

  def destroy
    @favorite.destory
  end

  private
  
  def favorite_params
    params.require(:favorite).merge(user_id: current_user.id, @item.id)
  end

  def item_find_params
    @item = Item.find(params[:id])
  end

  def find_favorite_params
    @favorite = Favorite.find(params[:id])
  end
end
