require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user, email: Faker::Internet.email)
  end

  describe 'ユーザー新規登録' do

  context  'ユーザ登録ができる時' do
    it '全ての項目が正しい値なら登録できること' do
      expect(@user).to be_valid
    end
  end

  context  'ユーザ登録ができない時' do
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it '生年月日が空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '同じメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    
    it 'メールアドレスに@が含まれていなければ登録できない' do
      @user.email = 'testexample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードが6文字以上であること' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'パスワードが半角英数字混合であること' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'パスワードとパスワード（確認）が一致すること' do
      @user.password_confirmation = 'password123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    
    it 'パスワードが英字のみでは登録できないこと' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    
    it 'パスワードが全角だと登録できないこと' do
      @user.password = 'パスワード１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    
    it '名字が必須であること' do
      @user.lastname_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
    end

    it '名前が必須であること' do
      @user.firstname_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
    end


    it '名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.lastname_kanji = 'test' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kanji is invalid")
    end

    it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.firstname_kanji = 'test' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kanji is invalid")
    end


    it '名字カナ(全角)が必須であること' do
      @user.lastname_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
    end

    it '名前カナ(全角)が必須であること' do
      @user.firstname_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
    end

    it '名字カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.lastname_katakana = 'tsst' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname katakana is invalid")
    end

    it '名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.firstname_katakana = 'test' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname katakana is invalid")
    end

  end
  end
end
