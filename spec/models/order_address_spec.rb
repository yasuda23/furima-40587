require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id, token: "tok_abcdefghijk00000000000000000")
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全ての項目が正しい値なら購入できること' do
        expect(@order_address).to be_valid
      end
      
      it '建物名が空でも登録できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end


    context '商品が購入できない時' do

    it "tokenが空では登録できないこと" do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  
    it '郵便番号が必須であること' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号は「3桁ハイフン4桁」の半角文字列でなければならないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '都道府県が必須であること' do
      @order_address.delivery_area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Delivery area must be other than 1")
    end

    it '市区町村が必須であること' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が必須であること' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が必須であること' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号は10桁以上11桁以内の半角数値でなければならないこと' do
      @order_address.phone_number = '０９０-１２３４-５６７８'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号は9桁以下では登録できないこと' do
      @order_address.phone_number = '090123456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号は12桁以上では登録できないこと' do
      @order_address.phone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'user_idが空では登録できないこと' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    
    it 'item_idが空では登録できないこと' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    end
  end
end
