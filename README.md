
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| manager     | integer | null: false |
| price       | float   | null: false |
| currency_id | integer | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages
(Active hash)
- belongs_to :currency

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


(Active hash)
- currency


# アプリ名: you owe me

## 概要
旅行中に友人とシェアしたお金やレシートをシェアした相手と管理できるアプリです。また、シェアした金額を打ち込むと1人分の金額計算、円換算された金額計算(海外旅行の場合)を行ってくれます。また、国内旅行やパーティーの打ち分け、個人的なお金のメモとしてもご利用頂けます。

## 本番環境
- [link-1]:https://you-owe-me.herokuapp.com/

### テストアカウント
- nana
### テストID
- nanana7

## 制作背景
私自身海外旅行がとても好きで、実際にお金のシェアが生じたことを洗い出すと以下の3点です。
1. アプリでの支払いはクレジット払いが多く、人数分の航空券や宿泊代、uber代などを誰か一人が代表して支払う時
2. お土産購入時に「10こ購入すると5こ無料」などの割引商品を友人とシェアしたい時
3. 両替所がすぐに見つからない時や、現地の通貨があまりすぎて使い切りたい友人と、現地の通貨が足り無くて友人内でのお金の貸し借りが生じる時

#### 問題点
- シェア代を受け持った際に、レートの確認、金額の計算、メモをする工程が手間であること
- レシートを写真で残すが観光時に撮影した写真のデータに埋もれた中から探すのは手間であること
- 旅行中の口頭だけでのやり取りは忘れることがあること
- お金の請求は友人でも催促がしにくいこと

#### このアプリが解決できること
- シェアしたお金やレシートを1つのアプリでまとめて管理できること
- 計算せずとも一人分の金額がわかること
- シェアした同士で可視化でき安心なこと、appが通知をしてくれる
- 電子や円で支払う場合でも円換算金額がすぐに確認できること
- 時間をかけずお金の管理ができることで旅行を存分に楽しめること

３人のユーザーで作られたグループルーム
[link-1]:https://gyazo.com/662db5d704ff9af8ce47220e8c0b5037
1人のユーザーでも円換算の早見、お金やレシートの管理のみで使えます

## 工夫したポイント
- you owe meのポイントはアプリ1つ完結型です
  アプリをまたがずに管理、計算をすることでシンプルに時間の短縮を考えました。
  また、個人ではなくシェアした相手とアプリを管理できることで、自然とお互いが責任をもちやすい形になっています。

## 使用技術(開発環境)
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / Trello

## 課題や今後実装したい機能
- 非同期通信を行えるようにし、投稿時のストレスを減らす
- アプリから直接写真を撮影できる仕様にする
- 通知設定の細かな設定
- 合計金額を表示できるような設定を作る
- メッセージも投稿可能にする
