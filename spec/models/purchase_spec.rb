require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    sleep 4
  end

  describe '商品購入' do
    context '商品購入が上手く行く時' do
     it "post_code, prefecture_id,city,address,phone_number,item_id,shipping_area_id,user_idが存在すれば登録できる" do
       expect(@purchase).to be_valid
     end
   end
    context '商品購入が上手く行かない時' do
      it "post_codeが空では登録できない" do
        @purchase.post_code= ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
        @purchase.post_code= "0000000"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "prefectureが1では登録できない" do
        @purchase.prefecture_id = "1"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では登録できない" do
        @purchase.city = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では登録できない" do
        @purchase.address = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numbeが空では登録できない" do
        @purchase.phone_number = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
   end
 end
end