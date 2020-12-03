require 'rails_helper'
describe PurchaserDestination do
  before do
    @purchaser_destination = FactoryBot.build(:purchaser_destination)
  end

  describe '商品購入' do
    context '購入がうまくいく時' do
      
      it '必要な情報が入力されていれば購入できる' do
        expect(@purchaser_destination).to be_valid
      end

    end

    context '購入がうまくいかない時' do
      
      it 'postalが空だと購入できない' do
        @purchaser_destination.postal = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Postal を入力してください", "Postal は-を含めて入力してください"
      end
      it 'postalに-が含まれていないと購入できない' do
        @purchaser_destination.postal = "1234567"
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Postal は-を含めて入力してください"
      end
      it 'prefecture_idが空だと購入できない' do
        @purchaser_destination.prefecture_id = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Prefecture can't be blank", "Prefecture を選択してください"
      end
      it 'prefecture_idが1だと購入できない' do
        @purchaser_destination.prefecture_id = 1
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Prefecture を選択してください"
      end
      it 'municipalitiesが空だと購入できない' do
        @purchaser_destination.municipalities = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Municipalities を入力してください"
      end
      it 'addressが空だと購入できない' do
        @purchaser_destination.address = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Address を入力してください"
      end
      it 'telephone_numberが空だと購入できない' do
        @purchaser_destination.telephone_number = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Telephone number を入力してください", "Telephone number は半角数字で入力してください"
      end
      it 'telephone_numberが11桁より多いと購入できない' do
        @purchaser_destination.telephone_number = "123456789012"
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Telephone number は11文字以内にしてください"
      end
      it 'telephone_numberが半角数字以外だと購入できない' do
        @purchaser_destination.telephone_number = "０１２３４５６７８９０１"
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Telephone number は半角数字で入力してください"
      end
      it 'telephone_numberに - が含まれていると登録できない' do
        @purchaser_destination.telephone_number = "090-0000-0000"
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Telephone number は半角数字で入力してください", "Telephone number は11文字以内にしてください"
      end
      it 'tokenが空だと購入できない' do
        @purchaser_destination.token = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Token カード情報を入力してください"
      end
    end
  end
end