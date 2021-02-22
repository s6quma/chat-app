require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    it "nameの値が存在すれば登録できること" do
      expect(@room).to be_valid
    end

    it "nameが空では登録できないこと" do
      @room.name = nil
      @room.valid?
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
    it "priceが空では登録できないこと" do
      @room.price = nil
      @room.valid?
      expect(@room.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが全角では登録できないこと" do
      @room.price = "２３"
      @room.valid?
      expect(@room.errors.full_messages).to include("Price is not a number")
    end
    it "currency_idが0では登録できないこと" do
      @room.currency_id = 0
      @room.valid?
      expect(@room.errors.full_messages).to include("Currency must be other than 0")
    end
  end
end
