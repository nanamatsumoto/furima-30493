class PurchasesController < ApplicationController
  before_action :set_form, only: [:create]

  def index
    @form = Form.new
  end

  def create
    # binding.pry
  end

  def set_form
    @form = Form.find(params[:id])
   end
end
