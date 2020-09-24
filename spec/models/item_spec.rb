require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it '記入欄の情報が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end

      context '商品出品がうまくいかないとき' do
        it '画像が空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が空では出品できない' do
          @item.introduction = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Introduction can't be blank")
        end
        it 'カテゴリについての情報を選択していなければ出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category is invalid. You must select')
        end
        it '商品の状態についての情報を選択していなければ出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition is invalid. You must select')
        end
        it '配送料の負担についての情報を選択していなければ出品できない' do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping fee is invalid. You must select')
        end
        it '配送元の地域についての情報を選択していなければ出品できない' do
          @item.shipping_from_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping from is invalid. You must select')
        end
        it '発送までの日数についての情報を選択していなければ出品できない' do
          @item.date_of_shipment_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Date of shipment is invalid. You must select')
        end
        it '価格が空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格が300円以下では商品は出品できない' do
          @item.price = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is invalid. Please type using half-width characters. Price is ¥300~¥9,999,999')
        end
        it '価格が9999999円以上の商品は出品できない' do
          @item.price = 99_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is invalid. Please type using half-width characters. Price is ¥300~¥9,999,999')
        end
        it '価格が半角英数字でなければ出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is invalid. Please type using half-width characters. Price is ¥300~¥9,999,999')
        end
      end
    end
  end
end
