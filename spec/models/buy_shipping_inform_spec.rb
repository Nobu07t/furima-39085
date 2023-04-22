require 'rails_helper'

RSpec.describe BuyShippingInform, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)

    @buy_shipping_inform = FactoryBot.build(:buy_shipping_inform, user_id: user.id, item_id: item.id)
  end

  describe '購入記録の保存' do

   context '内容に問題がない場合' do
    it 'すべての情報があれば登録できる' do
      expect(@buy_shipping_inform).to be_valid
    end
   end

   context '内容に問題がある場合' do

    it '建物名が空でも登録できる' do
      @buy_shipping_inform.building = nil
      expect(@buy_shipping_inform).to be_valid
    end

    it '郵便番号が空では登録できない' do
      @buy_shipping_inform.postal_code = nil
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include "Postal code can't be blank"
    end

    it '都道府県の情報が「id: 1」では登録できない' do
      @buy_shipping_inform.prefecture_id = "1"
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include "Prefecture can't be blank"
    end

    it '市区町村が空では登録できない' do
      @buy_shipping_inform.city = nil
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include "City can't be blank"
    end

    it '番地が空では登録できない' do
      @buy_shipping_inform.addresses = nil
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include "Addresses can't be blank"
    end

    it '電話番号が空では登録できない' do
      @buy_shipping_inform.phone_number = nil
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include "Phone number can't be blank"
    end

    it '郵便番号は、「3桁ハイフン4桁の半角文字列」でなければ登録できない' do
      @buy_shipping_inform.postal_code = "1234567"
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end

    it '電話番号が9桁以下では購入できない' do
      @buy_shipping_inform.phone_number = "123456789"
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include "Phone number is invalid"
    end

    it '電話番号が12桁以上では購入できない' do
      @buy_shipping_inform.phone_number = "123456789123"
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include "Phone number is invalid"
    end

    it "tokenが空では登録できないこと" do
      @buy_shipping_inform.token = nil
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include("Token can't be blank")
    end

    it "userが紐付いていなければ購入できない" do
      @buy_shipping_inform.user_id = nil
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include("User can't be blank")
    end

    it "itemが紐付いていなければ購入できない" do
      @buy_shipping_inform.item_id = nil
      @buy_shipping_inform.valid?
      expect(@buy_shipping_inform.errors.full_messages).to include("Item can't be blank")
    end
   end
  end
end