require 'rails_helper'

RSpec.describe 'Rooms', type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'グループの管理者のみグループルームを削除できること' do
    # サインインする
    sign_in(@room_user.user)

    # 作成されたグループルームへ遷移する
    click_on(@room_user.room.name)

    # ルームには削除ボタンが現れない
    expect(page).to have_no_content('ルーム削除')

    # トップページに遷移していることを確認する
    expect(current_path).to eq room_messages_path(@room_user.room)
  end

  it 'グループを削除すると、関連するメッセージがすべて削除されていること' do
    # サインインする
    sign_in(@room_user.user)

    #グループ作成ページへ遷移する
    click_on()

    # グループルームを作成する
    fill_in ''
    fill_in ''
    fill_in ''
    fill_in ''

    # 作成したグループルームへ遷移する
    click_on(@room_user.room.name)

    # 投稿情報を5つDBに追加する
    FactoryBot.create_list(:content, 5, room_id: @room_user.room.id, user_id: @room_user.user.id)

    # 「グループを終了する」ボタンをクリックすることで、作成した5つの投稿が削除されていることを確認する
    expect do
      find_link('ルーム削除', href: room_path(@room_user.room)).click
    end.to change { @room_user.room.content.count }.by(-5)
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
end
