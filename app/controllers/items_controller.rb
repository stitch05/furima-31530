class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  

  def index
    @items = Item.includes(:user).order("id DESC")
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
  end

  def update
    if @item.update(item_params)
    redirect_to item_path(@item)
    else
    render :edit
    end
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end

  private
  def move_to_index
    if current_user.id != @item.user.id || @item.purchase == nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
  

  def item_params
    params.require(:item).permit(:title,:text,:category_id,:delivery_fee_id,:shipping_area_id,:shipping_day_id,:trading_status_id,:price,:description,:name,:image).merge(user_id: current_user.id)
  end
end
