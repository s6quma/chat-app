class Currency < ActiveHash::Base
  self.data = [
    {id: 0, name: '--'}, {id: 1, name: 'US＄'}, {id: 2, name: 'CA＄'},
    {id: 3, name: 'CN¥'}, {id: 4, name: 'W'}, {id: 5, name: '€'},
    {id: 6, name: 'MX¥'}, {id: 7, name: 'R¥'}, {id: 8, name: '฿'},
    {id: 9, name: 'Rp'}, {id: 10, name: '₫'}, {id: 11, name: '¥'}
  ]

  include ActiveHash::Associations
  has_many :rooms
end