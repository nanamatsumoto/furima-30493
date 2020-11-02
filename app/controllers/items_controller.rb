class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update]

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
    if @item == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  def update
    @item.update(item_params)
    if 
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
