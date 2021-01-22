require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまく行くとき" do
      it "全ての項目が存在すれば、登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば、登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合、登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれていないと、登録できない" do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password")

      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "aa11"
        @user.password_confirmation = "aa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに半角英数字混合以外の入力がされていると登録できない" do
        @user.password = "1234567"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは存在しても、password_confilmationが存在していないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password,password_confirmationが一致していないと登録できない" do
        @user.password = "cccc9999"
        @user.password_confirmation = "cccc8888"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
        
      end
      it "名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "名字が半角英数字では登録できない" do
        @user.last_name = "nakamura"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "名前が半角英数字では登録できない" do
        @user.first_name = "mayu"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "名字の振り仮名がないと登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank", "Last kana is invalid")
      end
      it "名前の振り仮名がないと登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank", "First kana is invalid")
      end
      it "名字の振り仮名がカタカナ以外だと登録できない" do
        @user.last_kana = "なかむら"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
      end
      it "名前の振り仮名がカタカナ以外だと登録できない" do
        @user.first_kana = "まゆ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end