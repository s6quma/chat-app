require 'rails_helper'

RSpec.describe 'Rooms', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room_user = FactoryBot.create(:room_user)
    @room = FactoryBot.create(:room)
    @message = FactoryBot.create(:message)
  end

  it 'グループルームの作成と削除ができること' do

   # サインインする
   sign_in(@room_user.user)

   # トップページに遷移する
   visit root_path

   # グループ作成ページへ遷移する
   find_link(href: "/rooms/new").click
   expect(current_path).to eq new_room_path

   # グループルーム作成フォームを記述する
   fill_in 'room_name',with: @room.name
   fill_in 'room_price', with: @room.price
   select 'US$', from: 'room[currency_id]'

   # 作成ボタンをクリックする
   click_on('作成')

   # 作成したグループルームへ遷移する
   visit room_messages_path(@room.id)

   # 投稿情報を5つDBに追加する
   FactoryBot.create_list(:message, 2, room_id: @room_user.room.id, user_id: @room_user.user.id)

   #「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージも削除されることを確認する
   expect{
    find_link(href: room_path(@room_user.room)).click
  }.to change{ @room_user.room.messages.count }.by(-2)

    # トップページに遷移していることを確認する
   expect(current_path).to eq root_path
  end


  it 'グループ作成者以外グループルームの削除ができない時' do
    # サインインする
    sign_in(@room_user.user)

    # 作成されたグループルームへ遷移する
    click_on(@room_user.room.name)

    # ルームには削除ボタンが現れない
    expect(page).to have_no_content('ルーム削除')

  end

end
