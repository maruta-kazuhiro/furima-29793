require 'rails_helper'

RSpec.describe UserDestination, type: :model do
  describe '商品の発送情報' do
    before do
      @user_destination = FactoryBot.build(:user_destination)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_destination).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_destination.postal_code = ''
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_destination.postal_code = '12367'
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include('Postal code is invalid. Input postal code')
    end
    it 'shipping_from_idを選択していないと保存できないこと' do
      @user_destination.shipping_from_id = 1
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include('Shipping from is invalid. You must select')
    end
    it 'municipalitiesが空だと保存できないこと' do
      @user_destination.municipalities = ''
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @user_destination.address = ''
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Address can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @user_destination.building = ''
      expect(@user_destination).to be_valid
    end
    it 'telephone_numberが空だと保存できないこと' do
      @user_destination.telephone_number = ''
      @user_destination.valid?
      expect(@user_destination.errors.full_messages).to include("Telephone number can't be blank")
    end
  end
end
