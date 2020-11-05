class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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
    if current_user.id && @item.purchase.present?
      redirect_to root_path 
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end  
      redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :postage_id, :price, :region_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
   end

end
