class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseForm.new
    
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase.valid?
       pay_item
       @purchase.save
       redirect_to root_path
    else
       render 'index'
    end
  end

  private
  def purchase_params
    params.require(:purchase_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :shipping_area_id).merge(user_id: current_user.id,item_id:params[:item_id],token:params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_params[:token],    
      currency: 'jpy'                
    )
  end
end
