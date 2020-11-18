require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '正常ケース' do
      it '正常登録ケース' do
        expect(@user).to be_valid
      end
    end

    context '異常ケース' do
      it 'nicknameが未入力だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname ：ニックネームをご入力ください。')
      end
      it 'emailが未入力だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが登録済だと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@を含まないと登録できない' do
        @user.email = 'mailaddress'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email ：メールアドレスは@マークを入れてご入力ください。')
      end
      it 'passwordが未入力だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満だと登録できない' do
        @user.password = '1qaz9'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英数字の混合でないと登録できない。数字のみ' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password ：パスワードは半角英数字混合でご入力ください。')
      end
      it 'passwordが英数字の混合でないと登録できない。英字のみ' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password ：パスワードは半角英数字混合でご入力ください。')
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastnameが未入力だと登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname ：姓をご入力ください。')
      end
      it 'lastnameが全角漢字・ひらがな・カタカナではないと登録できない' do
        @user.lastname = 'A山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname ：姓は全角漢字・ひらがな・カタカナでご入力ください。')
      end
      it 'kana_lastnameが未入力だと登録できない' do
        @user.kana_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana lastname ：カナ(姓)を入力してください。')
      end
      it 'kana_lastnameが全角カタカナではないと登録できない' do
        @user.kana_lastname = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana lastname ：カナ(姓)は全角カタカナでご入力ください。')
      end

      it 'firstnameが未入力だと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname ：名をご入力ください。')
      end
      it 'firstnameが全角漢字・ひらがな・カタカナではないと登録できない' do
        @user.firstname = 'A太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname ：名は全角漢字・ひらがな・カタカナでご入力ください。')
      end
      it 'kana_firstnameが未入力だと登録できない' do
        @user.kana_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana firstname ：カナ(名)を入力してください。')
      end
      it 'kana_firstnameが全角カタカナではないと登録できない' do
        @user.kana_firstname = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana firstname ：カナ(名)は全角カタカナでご入力ください。')
      end
      it 'birthdayが未入力だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Birthday ：生年月日を入力してください。')
      end
    end
  end
end
