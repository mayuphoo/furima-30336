require 'rails_helper'

RSpec.describe Item, type: :item do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品が上手く行く時' do
      1
      it '全ての項目が存在すれば、登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が上手くいかない時' do
      it '画像が1枚添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が無いと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が無いと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品の状態についての情報が無いと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it '配送料の負担についての情報が無いと出品できない' do
        @item.shopping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping fee is not a number')
      end
      it '発送元の地域についての情報が無いと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送までの日数についての情報が無いと出品できない' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days is not a number')
      end
      it '価格についての情報が無いと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not included in the list',
                                                      'Price is invalid')
      end
      it '価格の範囲が、¥300~¥9,999,999の間でないと出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は半角数字での入力でしか保存できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
