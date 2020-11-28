require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it '必要な情報が入力されていれば出品できる' do 
        expect(@item).to be_valid
      end
    end
    context '出品がうまくいかない時' do
      it 'titleが空だと出品できない' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Title を入力してください"
      end
      it 'titleが40文字より多いと出品できない' do
        @item.title = "#{ 'あ' * 50 }"
        @item.valid?
        expect(@item.errors.full_messages).to include "Title は40文字以内にしてください"
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image を添付してください"
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank", "Category を選択してください"
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category を選択してください"
      end
      it 'textが空だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Text を入力してください"
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price を入力してください", "Price を入力してください", "Price は半角数字で入力してください", "Price は指定範囲内に設定してください"
      end
      it 'priceが300より低いと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は指定範囲内に設定してください"
      end
      it 'priceが10000000以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は指定範囲内に設定してください"
      end
      it 'priceは半角数字以外保存できない' do
        @item.price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price は半角数字で入力してください", "Price は指定範囲内に設定してください"
      end
      it 'delivery_fee_idが空だと出品できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank", "Delivery fee を選択してください"
      end
      it 'delivery_fee_idが1だと出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee を選択してください"
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship from location can't be blank", "Ship from location を選択してください"
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship from location を選択してください"
      end
      it 'shipping_date_idが空だと出品できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank", "Shipping date を選択してください"
      end
      it 'shipping_date_idが1だと出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date を選択してください"
      end
      it 'item_status_idが空だと出品できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item status can't be blank", "Item status を選択してください"
      end
      it 'item_status_idが1だと出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item status を選択してください"
      end
      it 'userと紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
