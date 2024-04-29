require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      end
    end
    context '新規登録できない場合' do
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは@を含まないと登録できない' do
      user = FactoryBot.build(:user)
      user.email = 'testmail'
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      user = FactoryBot.build(:user)
      user.password = '00000'
      user.password_confirmation = '00000'
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが半角英数混合でないと登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'お名前(全角・名)が空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'お名前(全角・氏)が空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前カナ(全角・名)が空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'お名前カナ(全角・氏)が空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    end
  end
end
