require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    describe 'グループが作成できる時' do
      it '全ての値が存在すれば登録できること' do
        expect(@room).to be_valid
      end
    end

    describe 'グループが作成できない時' do
      it 'nameが空では登録できないこと' do
        @room.name = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
      it 'priceが空では登録できないこと' do
        @room.price = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字では登録できないこと' do
        @room.price = '２３'
        @room.valid?
        expect(@room.errors.full_messages).to include('Price は半角数字(カンマなし)で入力をしてください')
      end
      it 'priceがカンマ付きでは登録できないこと' do
        @room.price = "2,000"
        @room.valid?
        expect(@room.errors.full_messages).to include('Price は半角数字(カンマなし)で入力をしてください')
      end
      it 'currency_idが0では登録できないこと' do
        @room.currency_id = 0
        @room.valid?
        expect(@room.errors.full_messages).to include('Currency を選択してください')
      end
    end
  end
end
