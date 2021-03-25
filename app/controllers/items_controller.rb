class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  

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
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to item_path(@item)
    else
    render :edit
    end
  end
  private
  def move_to_index
    @item = Item.find(params[:id])
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:title,:text,:category_id,:delivery_fee_id,:shipping_area_id,:shipping_day_id,:trading_status_id,:price,:description,:name,:image).merge(user_id: current_user.id)
  end
end
