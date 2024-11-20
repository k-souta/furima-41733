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
      it 'item_explanationが空では登録出来ない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it 'category_idが空では登録出来ない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'cost_idが空では登録出来ない' do
        @item.cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'cost_load_idが空では登録出来ない' do
        @item.cost_load_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost load can't be blank")
      end
      it 'prefecture_idが空では登録出来ない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'hidzuke_idが空では登録出来ない' do
        @item.hidzuke_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Hidzuke can't be blank")
      end
      it 'priceが空では登録出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'ユーザーが紐付いていないと出品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
