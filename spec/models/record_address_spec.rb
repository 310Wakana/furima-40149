require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @record_address = FactoryBot.build(:record_address, user_id: user.id)
  end

    describe '商品の購入' do
      context '商品が購入できる場合' do
        it '商品を購入できる' do
          expect(@record_address).to be_valid
        end
        it '建物名が空でも購入できる' do
          @record_address.building = ''
          expect(@record_address).to be_valid
        end
        it '電話番号が10桁であれば購入できる' do
          @record_address.phone_number = '0901234567'
          expect(@record_address).to be_valid
        end
        it '電話番号が11桁であれば購入できる' do
          @record_address.phone_number = '09012345678'
          expect(@record_address).to be_valid
        end
      end
      context '商品が購入できない場合' do
        it '郵便番号が空では購入できない' do
          @record_address.postal_code = ''
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it '郵便番号が「3桁ハイフン4桁」以外では購入できない' do
          @record_address.postal_code = '12-34567'
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Postal code is invalid.")
        end
        it '郵便番号が全角文字列では購入できない' do
          @record_address.postal_code = '１２３−４５６７'
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Postal code is invalid.")
        end
        it '都道府県が空では購入できない' do
          @record_address.prefecture_id = '1'
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村が空では購入できない' do
          @record_address.municipality = ''
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Municipality can't be blank")
        end
        it '番地が空では購入できない' do
          @record_address.house_number = ''
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("House number can't be blank")
        end
        it '電話番号が空では購入できない' do
          @record_address.phone_number = ''
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号が空では購入できない' do
          @record_address.phone_number = ''
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号が9文桁以下では購入できない' do
          @record_address.phone_number = '090123456'
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Phone number is invalid.")
        end
        it '電話番号が12文桁以上では購入できない' do
          @record_address.phone_number = '090123456789'
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Phone number is invalid.")
        end
        it '電話番号が半角数字以外では購入できない' do
          @record_address.phone_number = '０９０ー１２３４ー５６７８'
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Phone number is invalid.")
        end
        it "tokenが空では登録できないこと" do
          @record_address.token = nil
          @record_address.valid?
          expect(@record_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
