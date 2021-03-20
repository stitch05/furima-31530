require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
   @item = FactoryBot.build(:item)
 end
 describe '商品出品' do
   context '商品出品が上手く行く時' do
     it "name、category_id,price,user_id,delivery_fee_id,description,trading_status_id,shipping_area_id,shipping_day_idが存在すれば登録できる" do
        expect(@item).to be_valid
     end
    end
   context '商品出品が上手く行かない時' do
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "categoryが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "delivery_feeが空では登録できない" do
        @item.delivery_fee_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "trading_statusが空では登録できない" do
        @item.trading_status_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Trading status can't be blank")
      end
      it "shipping_areaが空では登録できない" do
        @item.shipping_area_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "shipping_daysが空では登録できない" do
        @item.shipping_day_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
   end
 end
end