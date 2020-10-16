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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスに「@」を含んでいなければ登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは６文字以上入力してください。')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードが英字のみだとユーザー登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を両方入力してください')
      end
      it 'パスワードが数字のみだとユーザー登録できない' do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を両方入力してください')
      end
      it '生年月日の情報が空だとユーザー登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it '姓の情報が空だとユーザー登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it '姓が全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
        @user.family_name = 'a1?'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角で入力してください')
      end
      it '名の情報が空だとユーザー登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it '名が全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
        @user.first_name = 'a1?'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角で入力してください')
      end
      it '姓（フリガナ）の情報が空だとユーザー登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カタカナ）を入力してください")
      end
      it '姓のフリガナが全角（カタカナ）以外だとユーザー登録できない' do
        @user.family_name_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カタカナ）は全角カタカナで入力してください')
      end
      it '名前（フリガナ）の情報が空だとユーザー登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カタカナ）を入力してください")
      end
      it '名前のフリガナが全角（カタカナ）以外だとユーザー登録できない' do
        @user.first_name_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カタカナ）は全角カタカナで入力してください')
      end
    end
  end
end
