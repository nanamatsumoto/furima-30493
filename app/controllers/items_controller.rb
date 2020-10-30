class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]

  def index
    @item = Item.new
  end

  def new
    @items = Item.new
  end

  def create
    
  end

  private

  def item_params
    params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  end
end
