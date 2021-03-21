require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
   @item = FactoryBot.build(:item)
 end
 describe '商品出品' do
   context '商品出品が上手く行く時' do
     it "name,category_id,price,user_id,delivery_fee_id,description,trading_status_id,shipping_area_id,shipping_day_id,imageが存在すれば登録できる" do
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
      it "category_idが1では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299円以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10000000円以上だと登録できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "商品価格が半角英数字混合では出品できない" do
        @item.price = "300aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "商品価格が半角英字のみでは出品できない" do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "商品価格が全角文字では出品できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "delivery_feeが空では登録できない" do
        @item.delivery_fee_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "delivery_fee_idが1では登録できない" do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "trading_statusが空では登録できない" do
        @item.trading_status_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Trading status can't be blank")
      end
      it "trading_status_idが1では登録できない" do
        @item.trading_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Trading status must be other than 1")
      end
      it "shipping_areaが空では登録できない" do
        @item.shipping_area_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "shipping_area_idが1では登録できない" do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "shipping_dayが空では登録できない" do
        @item.shipping_day_id= ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "shipping_day_idが1では登録できない" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
   end
 end
end