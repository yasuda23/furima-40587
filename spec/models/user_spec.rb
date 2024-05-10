require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    
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
      user1 = FactoryBot.create(:user, email: 'test@example.com')
      @user.email = user1.email
      @user.valid?
      expect(@user.errors.full_messages).to include('Email has already been taken')
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
      @user.password = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'パスワードとパスワード（確認）が一致すること' do
      @user.password_confirmation = 'password123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      @user.firstname_kanji = ''
      @user.lastname_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kanji can't be blank", "Lastname kanji can't be blank")
    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.firstname_kanji = 'test' 
      @user.lastname_kanji = 'test' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kanji is invalid", "Lastname kanji is invalid")
    end

    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      @user.firstname_katakana = ''
      @user.lastname_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname katakana can't be blank", "Lastname katakana can't be blank")
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.firstname_katakana = 'test' 
      @user.lastname_katakana = 'tsst' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname katakana is invalid", "Lastname katakana is invalid")
    end
    
  end
end
