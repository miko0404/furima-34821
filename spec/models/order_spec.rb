require 'rails_helper'

RSpec.describe '商品購入機能', type: :model do
  before do
    user = FactoryBot.create(:user) 
    item = FactoryBot.create(:item, user_id: user.id)
    @order = FactoryBot.build(:order, item_id: item.id, user_id: user.id)
  end

  context "登録できるとき" do
    it "電話番号は11桁以内の数値のみ登録できる" do
      @order.phone_number = '11111111111'
      expect(@order).to be_valid
    end

    it "すべての情報があれば登録できる" do
      expect(@order).to be_valid
    end
    it "建物名が空でも登録できる" do
      @order.building_name = ''
      expect(@order).to be_valid
    end
  end

  context "登録できない" do
    it "郵便番号が空だと登録できない" do
      @order.post_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end

    it "都道府県が空だと登録できない" do
      @order.address_id  = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it "都道府県の値が1だと登録できない" do
      @order.address_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it "市区町村が空だと登録できない" do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空だと登録できない" do
      @order.city_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City number can't be blank")
    end

    it "電話番号が空だと登録できない" do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が12桁以上だと登録できない" do
      @order.phone_number = '111111111111'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number Input only number")
    end

    it "電話番号が英数字混合だと登録できない" do
      @order.phone_number = 'a1111111111'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number Input only number")
    end

    it "郵便番号に-(ハイフン)がないと登録できない" do
      @order.post_code = '1231234'
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code is invalid")
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it "user_idが空では登録できない" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    
    it "item_idが空では登録できない" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end

  end
end
