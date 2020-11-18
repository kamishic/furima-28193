require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload("/files/test_image.gif")
    @user = FactoryBot.build(:user)
    @user.save
    @product.user_id = @user.id
  end
  describe '商品出品機能' do
    context '正常ケース' do
      it '正常登録ケース' do
        expect(@product).to be_valid
      end
    end
    context '異常ケース' do
      it 'imageが未アップロードだと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image ：出品画像を添付してください。")
      end
      it 'nameが未入力だと登録できない' do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name ：商品名をご入力ください。")
      end
      it 'descriptionが未入力だと登録できない' do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description ：商品の説明をご入力ください。")
      end
      it 'category_idが未入力だと登録できない' do
        @product.category_id = "0"
        @product.valid?
        expect(@product.errors.full_messages).to include("Category ：カテゴリーをご入力ください。")
      end
      it 'status_idが未入力だと登録できない' do
        @product.status_id = "0"
        @product.valid?
        expect(@product.errors.full_messages).to include("Status ：商品の状態をご入力ください。")
      end
      it 'cost_ship_idが未入力だと登録できない' do
        @product.cost_ship_id = "0"
        @product.valid?
        expect(@product.errors.full_messages).to include("Cost ship ：配送料の負担をご入力ください。")
      end
      it 'day_to_ship_idが未入力だと登録できない' do
        @product.day_to_ship_id = "0"
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to ship ：発送までの日数をご入力ください。")
      end
      it 'area_from_ship_idが未入力だと登録できない' do
        @product.area_from_ship_id = "0"
        @product.valid?
        expect(@product.errors.full_messages).to include("Area from ship ：発送元の地域をご入力ください。")
      end
      it 'priceが未入力だと登録できない' do
        @product.price = "0"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price ：価格は300~9999999の範囲でご入力ください")
      end
      it 'priceが300未満だと登録できない' do
        @product.price = "299"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price ：価格は300~9999999の範囲でご入力ください")
      end
      it 'priceが9999999より大きいと登録できない' do
        @product.price = "10000000"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price ：価格は300~9999999の範囲でご入力ください")
      end
      it 'priceが半角数字でないと登録できない' do
        @product.price = "あ"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price ：価格は300~9999999の範囲でご入力ください")
      end
    end
  end
end
