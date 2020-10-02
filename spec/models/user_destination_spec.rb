require 'rails_helper'

RSpec.describe UserDestination, type: :model do
  describe '商品の発送情報' do
    before do
      @user_destination = FactoryBot.build(:user_destination)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_destination).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @user_destination.postal_code = ''
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_destination.postal_code = '123456'
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include('Postal code is invalid. Input postal code')
    end
    it '都道府県を選択していないと保存できないこと' do
      @user_destination.shipping_from_id = 1
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include('Shipping from is invalid. You must select')
    end
    it '市区町村が空だと保存できないこと' do
      @user_destination.municipalities = ''
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @user_destination.address = ''
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Address can't be blank")
    end
    it '建物名は空でも保存できること' do
      @user_destination.building = ''
      expect(@user_destination).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @user_destination.telephone_number = ''
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Telephone number can't be blank")
    end
    it '電話番号にハイフンを含んでいると保存できないこと' do
      @user_destination.telephone_number = '123-4567890'
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Telephone number is not a number")
    end
  end
end
