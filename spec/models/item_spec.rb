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
          expect(@item.errors.full_messages).to include("画像を入力してください")
        end
        it '商品名が空では出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください")
        end
        it '商品の説明が空では出品できない' do
          @item.introduction = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品紹介を入力してください")
        end
        it 'カテゴリについての情報を選択していなければ出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
        end
        it '商品の状態についての情報を選択していなければ出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('状態を選択してください')
        end
        it '配送料の負担についての情報を選択していなければ出品できない' do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('配送料を選択してください')
        end
        it '配送元の地域についての情報を選択していなければ出品できない' do
          @item.shipping_from_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('都道府県を選択してください')
        end
        it '発送までの日数についての情報を選択していなければ出品できない' do
          @item.date_of_shipment_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
        end
        it '価格が空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("価格を入力してください")
        end
        it '価格が300円以下では商品は出品できない' do
          @item.price = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('価格は半角数字で入力してください。価格は¥300から¥9,999,999までです')
        end
        it '価格が9999999円以上の商品は出品できない' do
          @item.price = 99_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999
          @item.valid?
          expect(@item.errors.full_messages).to include('価格は半角数字で入力してください。価格は¥300から¥9,999,999までです')
        end
        it '価格が半角英数字でなければ出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('価格は半角数字で入力してください。価格は¥300から¥9,999,999までです')
        end
      end
    end
  end
end
