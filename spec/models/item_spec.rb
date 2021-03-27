require 'rails_helper'

RSpec.describe Item, type: :model do
 
   before do
     @item = FactoryBot.build(:item)
   end

   describe '商品登録' do
      context '商品登録がうまくいく時' do
        it '全て入力すれば登録できる' do
         expect(@item).to be_valid
        end
      end

       context '商品登録がうまくいかない時' do
         it '画像がないと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '名前がないと登録できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it '説明がないと登録できない' do
          @item.item_explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explanation can't be blank")
        end

        it 'category_idが1(未選択)では出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end 

        it 'category_idが未選択の場合は登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end

        it 'item_status_idが1の時は登録できない' do
          @item.item_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status must be other than 1")
        end

        it 'item_status_idが未選択の場合は登録できない' do
          @item.item_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status is not a number")
        end

        it 'postage_payer_idが1の時は登録できない' do
          @item.postage_payer_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
        end

        it 'postage_payer_idが未選択の場合は保存できない' do
          @item.postage_payer_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage payer is not a number")
        end

        it 'days_shipping_idが1の時は登録できない' do
          @item.days_shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Days shipping must be other than 1")
        end

        it 'days_shipping_idが未選択の場合は登録できない' do
          @item.days_shipping_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Days shipping is not a number")
        end

        it 'address_idが未選択の場合は保存できない' do
          @item.address_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Address is not a number")
        end

        it 'address_idが1の時は登録できない' do
          @item.address_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Address must be other than 1")
        end

        it '金額を入力しないと登録できない' do
          @item.exhibition_price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Exhibition price can't be blank")
        end

        it 'exhibition_priceが全角数字は登録できない' do
          @item.exhibition_price = '９９９'  
          @item.valid?
          expect(@item.errors.full_messages).to include("Exhibition price is not a number")
        end
        it 'exhibition_priceが文字では登録できない' do
          @item.exhibition_price = 'あいうえお'
          @item.valid?
          expect(@item.errors.full_messages).to include("Exhibition price is not a number")
        end

        it 'exhibition_priceが半角英数混合ではでは登録できない' do
          @item.exhibition_price = 'aaa111'
          @item.valid?
          expect(@item.errors.full_messages).to include("Exhibition price is not a number")
        end

        it 'exhibition_priceが半角英語だけでは登録できない' do
          @item.exhibition_price = 'aaaaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Exhibition price is not a number")
        end

        it '9999999円以上の時は登録できない' do
          @item.exhibition_price = 10000000 
          @item.valid?
          expect(@item.errors.full_messages).to include("Exhibition price must be less than 9999999")
        end
        it '300円未満の時は登録できない' do
          @item.exhibition_price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include("Exhibition price must be greater than 300")
        end

        it 'userと紐づいてないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end