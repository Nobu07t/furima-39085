require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

   context '商品出品できるとき' do
    it '全項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end
   end
    context '新規登録できないとき' do

      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品の説明が空では登録できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end

      it 'カテゴリーの情報が「id: 1」では登録できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '商品の状態の情報が「id: 1」では登録できない' do
        @item.sales_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status must be other than 1"
      end

      it '配送料の負担の情報が「id: 1」では登録できない' do
        @item.shipping_fee_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status must be other than 1"
      end
      
      it '発送元の地域の情報が「id: 1」では登録できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it '発送までの日数の情報が「id: 1」では登録できない' do
        @item.scheduled_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery must be other than 1"
      end

      it '価格の情報が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格は半角数値でなければ登録できない' do
        @item.price = "あ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '価格は¥300以上でなければ登録できない' do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '価格は¥9,999,999以下でなければ登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it '価格は整数でなければ登録できない' do
        @item.price = "500.55"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be an integer"
      end
      
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

   end
  end
end