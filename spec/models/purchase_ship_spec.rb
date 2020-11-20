require 'rails_helper'

RSpec.describe PurchaseShip, type: :model do
  before do
    @purchase_ship = FactoryBot.build(:purchase_ship)
  end
  describe '商品購入機能' do
    context '正常ケース' do
      it '正常登録ケース' do
        expect(@purchase_ship).to be_valid
      end
    end
    context '異常ケース' do
      it '正しいクレジットカード(=token取得)でないと購入できない' do
        @purchase_ship.token = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Token ：正しいクレジットカード情報をご入力ください。')
      end
      it 'zipcodeが未入力だと購入できない' do
        @purchase_ship.zipcode = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Zipcode ：郵便番号をご入力ください。')
      end
      it 'zipcodeがハイフンを含まないと購入できない' do
        @purchase_ship.zipcode = '1234567'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Zipcode ：郵便番号はxxx-xxxxの形でご入力ください。')
      end
      it 'prefecture_idが未入力だと購入できない' do
        @purchase_ship.prefecture_id = '0'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Prefecture ：都道府県をご入力ください。')
      end
      it 'cityが未入力だと購入できない' do
        @purchase_ship.city = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('City ：市区町村をご入力ください。')
      end
      it 'blockが未入力だと購入できない' do
        @purchase_ship.block = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Block ：番地をご入力ください。')
      end
      it 'phoneが未入力だと購入できない' do
        @purchase_ship.phone = ''
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Phone ：電話番号をご入力ください。')
      end
      it 'phoneが12桁以上の数字だと購入できない' do
        @purchase_ship.phone = '123456789012'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Phone ：電話番号は11桁以内の半角数字でご入力ください。')
      end
      it 'phoneが数字以外だと購入できない' do
        @purchase_ship.phone = '12abcdefg'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Phone ：電話番号は11桁以内の半角数字でご入力ください。')
      end
      it 'phoneがハイフン入りだと購入できない' do
        @purchase_ship.phone = '123-456-789'
        @purchase_ship.valid?
        expect(@purchase_ship.errors.full_messages).to include('Phone ：電話番号は11桁以内の半角数字でご入力ください。')
      end
    end
  end
end
