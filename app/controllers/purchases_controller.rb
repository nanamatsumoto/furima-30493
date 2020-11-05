class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  # before_action :move_to_signed_in, expect: [:index]

  def index
    @form = Form.new
    if  current_user.id && @item.purchase.present?
      # @item.purchase.user_id.present?
      redirect_to root_path 
    end
  end

  def create
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
      @form.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:post_code, :prefectures_id, :city, :house_number, :building_name, :phone_number, :purchase).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: form_params[:token],    
        currency: 'jpy'                 
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
   end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to root_path
    end
  end
end