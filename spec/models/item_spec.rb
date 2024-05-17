require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '商品を出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it '商品説明が空では出品できない' do
        @item.concept = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it 'カテゴリーの情報が"1"では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が"1"では出品できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '配送料の負担の情報が"1"では出品できない' do
        @item.delivery_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charges can't be blank")
      end
      it '発送元の地域の情報が"Id:1"では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が"Id:1"では出品できない' do
        @item.arrival_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrival date can't be blank")
      end
      it '価格の情報が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が￥300より小さい場合は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price doesn't apply")
      end
      it '価格が￥9,999,999より大きい場合は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price doesn't apply")
      end
      it '価格は全角数字だと出品できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price doesn't apply")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end