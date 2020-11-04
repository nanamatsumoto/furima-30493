class PurchasesController < ApplicationController
  def index
    # @form = Item.form.includes(:item)
    @form = Form.new
  end

  def create
    # @form = Item.form.includes(:item)
    @form = Form.new(form_params)
    if @form.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:post_code, :prefectures_id, :city, :house_number, :building_name, :phone_number, :purchase, :user_id, :item_id)
  end
end