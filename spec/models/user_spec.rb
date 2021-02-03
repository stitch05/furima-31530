require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規投稿がうまくいくとき'do
      it "nicknameとemail、passwoedとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、bitth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end

    context '新規投稿がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だでは登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        anorher_user.valid?
        expect(another_user.errors.full_massages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_massages).to include("Password is too short (maximum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない"
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name can't be blank")
      end
      it "first_nameが空では登録できない"
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name can't be blank")
      end
      it "last_name_kanaが空では登録できない"
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
      end
      it "first_name_kanaが空では登録できない"
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
      end
      it "birth_dayが空では登録できない"
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth_day can't be blank")
      end
    end
  end
end