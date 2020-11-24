require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context "新規登録がうまくいく時" do
      it "必要な情報が入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録がうまくいかない時" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end  
      it "重複したemailでは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "emailに@が無ければ登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid", "Email には@を入れてください"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password は英字と数字を含む必要があります"
      end
      it "passwordが6文字以下だと登録できない" do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordに数字が含まれていないと登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は英字と数字を含む必要があります"
      end
      it "passwordに英字が含まれていないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は英字と数字を含む必要があります"
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @user.password_confirmation = "11111a"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank", "Family name は全角で入力してください"
      end
      it "family_nameが半角入力だと登録できない" do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name は全角で入力してください"
      end
      it "first_nameが空だと登録できない" do
        @user.first_name =  ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", "First name は全角で入力してください"
      end
      it "first_nameが半角入力だと登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name は全角で入力してください"
      end
      it "kana_familyが空だと登録できない" do
        @user.kana_family = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana family can't be blank", "Kana family は全角カタカナで入力してください"
      end
      it "kana_familyがカタカナ以外だと登録できない" do
        @user.kana_family = "あ亜"
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana family は全角カタカナで入力してください"
      end
      it "kana_firstが空だと登録できない" do
        @user.kana_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first can't be blank", "Kana first は全角カタカナで入力してください"
      end
      it "kana_firstがカタカナ以外だと登録できない" do
        @user.kana_first = "あ亜"
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first は全角カタカナで入力してください"
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
