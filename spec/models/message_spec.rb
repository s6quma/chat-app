require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    describe '投稿データが保存できる時' do
      it 'contentとimageが存在していれば保存できること' do
        expect(@message).to be_valid
      end

      it 'contentが空でも保存できること' do
        @message.content = nil
        expect(@message).to be_valid
      end

      it 'imageが空でも保存できること' do
        @message.image = nil
        expect(@message).to be_valid
      end

      it '数値のみをフォームに入力すると金額が保存できること' do
        @message.content = '0.96'
        expect(@message).to be_valid
      end
    end

    describe '投稿データが保存できない時' do
      it 'contentとimageが空では保存できないこと' do
        @message.content = nil
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end

      it 'roomが紐付いていないと保存できないこと' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Room must exist')
      end

      it 'userが紐付いていないと保存できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('User must exist')
      end
    end
  end
end
