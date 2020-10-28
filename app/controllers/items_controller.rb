class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]

  def index
  end

  def new
    @items = Item.new
  end

  def create
    
  end
end
