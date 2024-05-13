require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品出品機能' do

    context '商品登録ができる時' do
      it '全ての項目が正しい値なら登録できること' do
        expect(@item).to be_valid
      end
    end
    
    context  '商品登録ができない時' do
  
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
    end


    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Explanation can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category must be other than 1")
    end

    it '商品の状態の情報が必須であること' do
      @item.quality_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Quality must be other than 1")
    end

    it '配送料の負担の情報が必須であること' do
      @item.who_pay_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Who pay must be other than 1")
    end

    it '発送元の地域の情報が必須であること' do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Delivery area must be other than 1")
    end

    it '発送までの日数の情報が必須であること' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Delivery day must be other than 1")
    end

    it '価格の情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price can't be blank")
    end

    it '価格が¥300より小さければ保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    
    it '価格が¥9,999,999より大きければ保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    
    it '価格が半角数値でなければ保存できないこと' do
      @item.price = '３００' 
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'userが紐づいていなければ登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    
  end
  end
end
