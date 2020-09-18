require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa0000'
        @user.password_confirmation = 'aaa0000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに「@」を含んでいなければ登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが英字のみだとユーザー登録できない' do
        @user.password = "aaaaaaa"
        @user.password_confirmation = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Use half-width alphanumeric both.")
      end
      it 'パスワードが数字のみだとユーザー登録できない' do
        @user.password = "1111111"
        @user.password_confirmation = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Use half-width alphanumeric both.")
      end
      it '生年月日の情報が空だとユーザー登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '姓の情報が空だとユーザー登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it '姓が全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
        @user.family_name = "a1?"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end
      it '名の情報が空だとユーザー登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名が全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
        @user.first_name = "a1?"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it '姓（フリガナ）の情報が空だとユーザー登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it '姓のフリガナが全角（カタカナ）以外だとユーザー登録できない' do
        @user.family_name_kana = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
      end
      it '名（フリガナ）の情報が空だとユーザー登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名のフリガナが全角（カタカナ）以外だとユーザー登録できない' do
        @user.first_name_kana = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
    end
  end
end