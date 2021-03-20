json.user_ids @room.user_ids.length != 1
json.currency_id @room.currency_id != 10
json.currency @room.currency.name

jason.user_name @message.user.name
json.create_at @message.create_at
json.content @message.content
json.user_id @message.user.id
json.room_number @room.room_number
json.room_currency_name @room.currency.name

json.total_price @message.content.floor(2).to_s(:delimited)
json.change_yen (@message.content / @room.price * 100).floor(0).to_s(:delimited)
json.split_price (@message.content / @room.price * 100 / @room.number).floor().to_s(:delimited)

json.image @message.image.variant(resize: '300x400')


