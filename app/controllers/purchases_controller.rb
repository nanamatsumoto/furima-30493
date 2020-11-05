class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  # before_action :authenticate_user!, only: [:index]

  def index
    # redirect_to root_path if current_user.id == @item.user_id
    @form = Form.new
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
   Payjp.api_key = "sk_test_9d8bd88185e6e5e7b3ae05b0"  
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: form_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
   end
end

