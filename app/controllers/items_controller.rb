class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]

  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    return redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :postage_id, :price, :region_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
