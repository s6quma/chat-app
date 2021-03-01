class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :currency

  with_options presence: true do
    validates :name
    validates :manager
    validates :price, numericality: true, numericality: { message: 'は半角数字(カンマなし)で入力をしてください' }
  end
  validates :currency_id, numericality: { other_than: 0 , message: 'を選択してください'}

  def number
    @number = users.length
  end
end
