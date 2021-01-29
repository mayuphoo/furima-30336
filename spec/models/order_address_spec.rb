require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
     end

     it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it '電話番号には、ハイフンがなくても保存できること' do
      @order_address.phone = '09012345678'
      expect(@order_address).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号には、ハイフンが必要なこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
    end

    it '都道府県が空だと保存できないこと' do
      @order_address.prefecture_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空だと保存できないこと' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと保存できないこと' do
      @order_address.block_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block number can't be blank")
    end

    it '電話番号が空だと保存できないこと' do
      @order_address.phone = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号にハイフンが含まれていると保存できないこと'do
    @order_address.phone = '090-1234-5678'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号が11桁以上だと保存できないこと' do
      @order_address.phone = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  
    end
  end
end