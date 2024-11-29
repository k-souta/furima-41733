require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end
  describe '寄付情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'constructionがからでも保存できること' do
        @order_form.construction = ''
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'postが空では登録できないこと' do
        @order_form.post = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post can't be blank",
                                                            'Post is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postが半角ハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_form.post = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
      end
      it 'municipalityが空では登録できないこと' do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では登録できないこと' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空では登録できないこと' do
        @order_form.phone = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone can't be blank", 'Phone is invalid. Input only number')
      end
      it 'phoneが数字以外を含む場合は保存できないこと' do
        @order_form.phone = '01234abcd'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid. Input only number')
      end
      it 'phoneが9桁以下では保存できないこと' do
        @order_form.phone = '01234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid. Input only number')
      end
      it 'phoneが12桁以上だは保存できないこと' do
        @order_form.phone = '012345678901'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid. Input only number')
      end
      it 'phoneにハイフンが含まれていると保存できない' do
        @order_form.phone = '030-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone is invalid. Input only number')
      end
      it 'userが紐ついていないと保存できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空白だと登録できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
