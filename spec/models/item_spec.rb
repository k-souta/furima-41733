require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品を出品できる場合' do
      it '必要情報を全て不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない場合' do
      it 'item_nameが空では登録出来ない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_explanationが1では登録出来ない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it 'category_idが1では登録出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'cost_idが1では登録出来ない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'cost_load_idが1では登録出来ない' do
        @item.cost_load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost load can't be blank")
      end
      it 'prefecture_idが1では登録出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'hidzuke_idが1では登録出来ない' do
        @item.hidzuke_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Hidzuke can't be blank")
      end
      it 'priceが空では登録出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は、¥300~¥9,999,999の間でないと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')

        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数値でなければ保存できない' do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '商品画像を1枚つけなければ保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザーが紐付いていないと出品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
